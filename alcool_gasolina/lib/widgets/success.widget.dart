import 'package:flutter/material.dart';
import 'loading-button.widget.dart';

class Success extends StatelessWidget {
  var result = "";
  Function functionReset;


  Success({
    @required this.result,
    @required this.functionReset
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 50, bottom: 25, left: 10, right: 10),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 27,
                      fontFamily: "Ubuntu"),
                )),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: LoadingButton(
                  text: "CALCULAR NOVAMENTE",
                  invert: true,
                  busy: false,
                  function: functionReset,
                )),
          ],
        ));
  }
}
