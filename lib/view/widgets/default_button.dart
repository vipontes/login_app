import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/utils/login_app_styles.dart';

class DefaultButton extends StatelessWidget {
  final String buttonCaption;

  const DefaultButton({Key key, this.buttonCaption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 45,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              LoginAppStyles.loginButtonGradientStart,
              LoginAppStyles.loginButtonGradientEnd
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: Text(
          buttonCaption.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
