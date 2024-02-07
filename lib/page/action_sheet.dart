import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActionSheet {
  ActionSheet({
    required this.actions,
    this.cancel,
    this.title,
    this.message,
  });

  final String? title;
  final String? message;
  final List<Action> actions;
  final Action? cancel;

  void show(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      _showSimpleDialogForAndroid(context);
    } else {
      _showActionSheetForIOS(context);
    }
  }

  void _showSimpleDialogForAndroid(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            if (title != null)
              Text(
                title ?? '',
              ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message ?? '',
              ),
            ],
          ],
        ),
        children: [
          ...actions.map((action) {
            return SimpleDialogOption(
              onPressed: () {
                action.execute();
                Navigator.pop(context, true);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  action.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
        ],
      ),
    ).then((isActionPressed) {
      if (isActionPressed != true) {
        cancel?.execute();
      }
    });
  }

  void _showActionSheetForIOS(BuildContext context) {
    final _cancel = cancel;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: title == null
            ? null
            : Text(
                title ?? '',
              ),
        message: message == null
            ? null
            : Text(
                message ?? '',
              ),
        actions: [
          ...actions.map(
            (action) {
              return CupertinoActionSheetAction(
                onPressed: () {
                  action.execute();
                  Navigator.pop(context);
                },
                child: Text(
                  action.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ],
        cancelButton: (_cancel != null)
            ? CupertinoActionSheetAction(
                onPressed: () {
                  _cancel.execute();
                  Navigator.pop(context);
                },
                child: Text(
                  _cancel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,
      ),
    );
  }
}

class Action {
  Action(
    this.title,
    this.execute, {
    this.style,
  });

  final TextStyle? style;
  final String title;
  final Function() execute;
}
