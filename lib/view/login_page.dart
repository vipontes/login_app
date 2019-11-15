import 'package:flutter/material.dart';
import 'package:login_app/utils/app_localizations.dart';
import 'package:login_app/view_model/login_page_view_model.dart';

class LoginPage extends StatefulWidget {
  final LoginPageViewModel viewModel;

  LoginPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future loadData() async {
    var success = await widget.viewModel
        .login("vipontes70@gmail.com", "admin", "emulador");
    if (success == true) {
      var val = widget.viewModel.tokens;
      print(val.token);
      print(val.refreshToken);
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('first_string'),
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).translate('second_string'),
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'This will not be translated.',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
