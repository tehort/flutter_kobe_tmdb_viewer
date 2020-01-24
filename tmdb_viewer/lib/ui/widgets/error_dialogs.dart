import 'dart:core';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/core/constants/theme.dart';

Future showErrorDialog(BuildContext context, String message) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Aviso', style: AppTheme.styleAlertHeaderText()),
        content: Text(
          '$message',
          style: AppTheme.styleAlertBodyText(),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok', style: AppTheme.styleAlertButtonText()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future showAlert(BuildContext context, String title, String message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, style: AppTheme.styleAlertHeaderText()),
        content: Text(message, style: AppTheme.styleAlertBodyText()),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok', style: AppTheme.styleAlertButtonText()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<bool> showDialogBool(BuildContext context, String title, String message, String msgTrue, String msgFalse) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 20.0)),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(msgTrue, style: TextStyle(fontSize: 18.0)),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(msgFalse, style: TextStyle(fontSize: 18.0)),
        ),
      ],
    ),
  );
}
