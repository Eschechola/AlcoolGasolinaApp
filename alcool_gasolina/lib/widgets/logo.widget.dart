import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Center(
            child: Image.asset("assets/images/aog-white.png", height: 80),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 50
          ),
          child: Text(
            "Álcool ou Gasolina",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: "Ubuntu"
              ),
          ),
        )
      ],
    );
  }
}
