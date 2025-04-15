import 'package:flutter/material.dart';

import '../../shared/colors_app.dart';

typedef UpdateMatchCallback = void Function(ValueKey<int> key, bool match);

class PasswordDotValidationWidget extends StatelessWidget {
  final String label;
  final String patternValidation;
  final ValueNotifier<String> passwordValue;
  final UpdateMatchCallback updateMatch;
  const PasswordDotValidationWidget({
    required super.key,
    required this.label,
    required this.patternValidation,
    required this.passwordValue,
    required this.updateMatch,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordValue,
      builder: (context, passowwordText, child) {
        final valid = RegExp(patternValidation).hasMatch(passowwordText);
        updateMatch(super.key as ValueKey<int>, valid);
        return Row(
          spacing: 8,
          children: [
            Container(
              height: 13,
              width: 13,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: valid,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: mediumGray,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ],
        );
      },
    );
  }
}
