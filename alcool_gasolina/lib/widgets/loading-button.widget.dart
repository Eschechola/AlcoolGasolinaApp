import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function function;
  var text = "";

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.function,
    @required this.text
  });


  @override
  Widget build(BuildContext context) {
    return  

    busy
    
    ? Container(
      alignment: Alignment.center,
      height: 50,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    )

    : Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: invert
          ? Theme.of(context).primaryColor
          : Colors.white.withOpacity(0.8),

          borderRadius: BorderRadius.circular(60)
        ),
        child: FlatButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(
              color: invert
              ? Colors.white.withOpacity(0.8)
              : Theme.of(context).primaryColor,
              fontSize: 18,
              fontFamily: "Ubuntu")
            )
          ),
      );
  }
}
