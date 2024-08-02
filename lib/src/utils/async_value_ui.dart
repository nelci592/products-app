import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

extension AsyncValueUI on AsyncValue {
  showErrorSnackBar(BuildContext context, {String? errorMessage}) {
    if (hasError && !isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(errorMessage ?? error.toString()).textColor(Colors.white),
        ),
      );
    }
  }
}
