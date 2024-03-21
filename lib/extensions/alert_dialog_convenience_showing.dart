import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension AlertDialogConvenienceShowing on AlertDialog {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required List<AlertAction> actions,
    Widget? inputField,
    String? title,
    String? message,
    Function()? onDismissed,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: defaultTargetPlatform == TargetPlatform.android,
      builder: (context) {
        if (defaultTargetPlatform == TargetPlatform.android) {
          return _buildAndroidAlertDialog(
            context,
            title: title,
            message: message,
            inputField: inputField,
            actions: actions,
          );
        } else {
          return _buildIOSAlertDialog(
            context,
            title: title,
            message: message,
            inputField: inputField,
            actions: actions,
          );
        }
      },
    ).then((_) => onDismissed?.call());
  }

  static AlertDialog _buildAndroidAlertDialog(
    BuildContext context, {
    required List<AlertAction> actions,
    String? title,
    String? message,
    Widget? inputField,
  }) {
    final textButtons = actions.map(
      (action) {
        return TextButton(
            onPressed: () {
              final onPressed = action.onPressed;

              Navigator.of(context).pop();
              if (onPressed != null) {
                onPressed();
              }
            },
            child: Text(
              action.title,
              style: action.style,
            ));
      },
    ).toList();

    return AlertDialog(
      title: (title == null) ? null : Text(title),
      content: (message == null && inputField == null)
          ? null
          : SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (message != null) Text(message),
                  if (inputField != null) inputField,
                ],
              ),
            ),
      actions: (textButtons.length <= 2)
          ? textButtons
          : [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: textButtons,
              )
            ],
    );
  }

  static CupertinoAlertDialog _buildIOSAlertDialog(
    BuildContext context, {
    required List<AlertAction> actions,
    String? title,
    String? message,
    Widget? inputField,
  }) {
    return CupertinoAlertDialog(
      title: (title == null) ? null : Text(title),
      content: (message == null && inputField == null)
          ? null
          : SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  if (message != null) Text(message),
                  if (inputField != null)
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: inputField,
                    ),
                ],
              ),
            ),
      actions: actions.map(
        (action) {
          return CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                final onPressed = action.onPressed;

                if (onPressed != null) {
                  onPressed();
                }
              },
              child: Text(action.title, style: action.style));
        },
      ).toList(),
    );
  }
}

class AlertAction {
  AlertAction(
    this.title, {
    this.style,
    this.onPressed,
  });

  final String title;
  final TextStyle? style;
  final VoidCallback? onPressed;
}
