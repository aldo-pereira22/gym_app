import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryButton = Color.fromARGB(255, 220, 220, 255);
  Color _gradientMainColor = Color.fromARGB(255, 0, 75, 200);
  Color _gradientSecondColor = Color.fromARGB(255, 75, 175, 255);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButton() {
    return _activeSecondaryButton;
  }

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSeconColor() {
    return _gradientSecondColor;
  }
}
