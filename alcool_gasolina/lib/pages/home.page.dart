import 'package:alcool_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasolinaCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool!";

  Future calculate(){
    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    //converte o texto pra double substituindo , por .
    double alcool = double.parse(_alcoolCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gasolina = double.parse(_gasolinaCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double result = alcool/gasolina;
    String resultText;

    if(result >= 0.7){
      resultText = "Compensa utilizar Gasolina!";
    }
    else{
      resultText = "Compensa utilizar Álcool!";
    }

    //delay pra simular uma "requisição ao banco"
    //após o delay executa a função
    return new Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _color = Colors.deepPurple;
          _resultText = resultText; 
          _completed = true;
          _busy = false;
        });
      }
    );
  }

  void reset(){
    setState(() {
      _alcoolCtrl = new MoneyMaskedTextController();
      _gasolinaCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          microseconds: 1200
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            
            _completed
            ? Success(
              result: _resultText,
              functionReset: reset
            )
            : SubmitForm(
                alcoolCtrl: _alcoolCtrl,
                gasolinaCtrl: _gasolinaCtrl,
                busy: _busy,
                submitFunc: calculate,
            )
          ],
        ),
      )
    );
  }
}
