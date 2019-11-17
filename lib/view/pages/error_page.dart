import 'package:flutter/material.dart';
import 'package:login_app/utils/app_localizations.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('404_title')),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).translate('404')),
      ),
    );
  }
}
