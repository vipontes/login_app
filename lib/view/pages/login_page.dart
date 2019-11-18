import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/services/quotes_service.dart';
import 'package:login_app/utils/app_localizations.dart';
import 'package:login_app/view/widgets/default_button.dart';
import 'package:login_app/view_model/login_page_view_model.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  final LoginPageViewModel viewModel =
      LoginPageViewModel(apiSvc: QuotesApiService());

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey scrollKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future _loadData(String email, String password) async {
    // remove o teclado da tela
    FocusScope.of(context).requestFocus(FocusNode());

    var success = await widget.viewModel.login(email, password);
    if (success == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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
        key: scrollKey,
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
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          prefixIcon: Icon(
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
                      padding: EdgeInsets.only(
                          top: 20, left: 30, right: 30, bottom: 4),
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
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
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          _loadData(
                              _emailController.text, _passwordController.text);
                        }
                      },
                      child: new DefaultButton(
                          buttonCaption: AppLocalizations.of(context)
                              .translate('login_button')),
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
