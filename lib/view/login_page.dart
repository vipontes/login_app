import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/database/moor_database.dart';
import 'package:login_app/utils/app_localizations.dart';
import 'package:login_app/utils/login_app_styles.dart';
import 'package:login_app/view_model/login_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  final LoginPageViewModel viewModel;

  LoginPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future _loadData(LoginDao database, String email, String password) async {
    // remove o teclado da tela
    FocusScope.of(context).requestFocus(FocusNode());

    var success = await widget.viewModel.login(email, password);
    if (success == true) {
      widget.viewModel.saveToken(database);
    } else {
      var val = widget.viewModel.error;
      Toast.show(val.message, context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 150),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 4, left: 30, right: 30, bottom: 4),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: AppLocalizations.of(context)
                              .translate('email_hint'),
                        ),
                        validator: (value) => !EmailValidator.validate(value)
                            ? AppLocalizations.of(context)
                                .translate('empty_email')
                            : null,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 30, right: 30, bottom: 4),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          hintText: AppLocalizations.of(context)
                              .translate('password_hint'),
                        ),
                        validator: (value) => (value.trim().isEmpty)
                            ? AppLocalizations.of(context)
                                .translate('empty_password')
                            : null,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 32),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('forgot_password'),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          final database = Provider.of<LoginDao>(context);

                          _loadData(database, _emailController.text,
                              _passwordController.text);
                        }
                      },
                      child: Container(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('login_button')
                                .toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
