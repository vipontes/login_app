import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_app/services/quotes_service.dart';
import 'package:login_app/utils/app_localizations.dart';
import 'package:login_app/view/login_page.dart';
import 'package:login_app/view_model/login_page_view_model.dart';

final LoginPageViewModel loginPageViewModel =
    LoginPageViewModel(apiSvc: QuotesApiService());

void main() => runApp(LoginApp(loginPageViewModel: loginPageViewModel));

class LoginApp extends StatelessWidget {
  final LoginPageViewModel loginPageViewModel;

  LoginApp({@required this.loginPageViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: LoginPage(viewModel: loginPageViewModel),
    );
  }
}
