import 'package:alcool_gasolina/widgets/input.widget.dart';
import 'package:alcool_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaCtrl = new MoneyMaskedTextController();
  var alcoolCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
      @required this.alcoolCtrl,
      @required this.gasolinaCtrl,
      @required this.busy,
      @required this.submitFunc
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(label: "Gasolina", ctrl: gasolinaCtrl),
        Input(label: "Álcool", ctrl: alcoolCtrl),
        Padding(
            padding:
                EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.18,
                ),
            child: LoadingButton(
              text: "CALCULAR",
              invert: false,
              busy: busy,
              function: submitFunc,
            ))
      ],
    );
  }
}
