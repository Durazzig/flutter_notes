import 'package:flutter/material.dart';

abstract class Alerts {
  static Future<void> showAlert({
    required BuildContext context,
    String? iconPath,
    String? title,
    Widget? body,
    required String? primaryButtonText,
    VoidCallback? onPrimaryButtonPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryButtonPressed,
    Color? primaryColor,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Center(child: Text(title)) : null,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (iconPath != null) AlertIcon(iconPath: iconPath),
              if (body != null) body,
            ],
          ),
          actions: [
            Row(
              children: [
                if (secondaryButtonText != null)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onSecondaryButtonPressed,
                      child: Text(secondaryButtonText),
                    ),
                  ),
                if (primaryButtonText != null && secondaryButtonText != null)
                  const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onPrimaryButtonPressed,
                    child: Text(primaryButtonText ?? ""),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
