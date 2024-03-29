import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void toastSuccess({required String message, required BuildContext context}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
    ),
  );
}

void toastFailure({required String message, required BuildContext context}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
    ),
  );
}

void toastInformation(
    {required String message, required BuildContext context}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
    ),
  );
}
