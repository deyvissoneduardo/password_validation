import 'dart:developer';

import 'package:flutter/material.dart';

import '../../shared/colors_app.dart';
import 'password_dot_validation_widget.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final ValueChanged<bool> passwordValid;

  const PasswordValidationPanelWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordValid,
  });

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
  final validationRulesPasswordText = ValueNotifier('');
  final approvedRules = List.generate(5, (index) => false);
  var passwordValid = false;

  void updateValidRule(ValueKey<int> key, bool valid) {
    approvedRules[key.value] = !valid;
    checkRules();
  }

  void checkRules() {
    final valid = approvedRules.every((rule) => rule);
    if (valid != passwordValid) {
      passwordValid = valid;
      widget.passwordValid(valid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            'SUA SENHA DEVE CONTER',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        PasswordDotValidationWidget(
          label: 'Minino de 8 caracters',
          key: ValueKey(0),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'^.{8,}$',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: 'Uma letra maiuscula',
          key: ValueKey(1),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[A-Z]',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: 'um ou mais numero',
          key: ValueKey(2),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[0-9]',
          updateMatch: updateValidRule,
        ),
        PasswordDotValidationWidget(
          label: 'um ou mais caracteres especiais',
          key: ValueKey(3),
          passwordValue: validationRulesPasswordText,
          patternValidation: r'[!@#\$%^&*(),.?":{}|<>_\-=+\[\]\\/~`´;]',
          updateMatch: updateValidRule,
        ),
        ValueListenableBuilder(
          valueListenable: widget.confirmPasswordController,
          builder: (context, confirmPassowordText, child) {
            return PasswordDotValidationWidget(
              label: 'Senha igual ao confirmar senha',
              key: ValueKey(4),
              passwordValue: validationRulesPasswordText,
              patternValidation:
                  '^${RegExp.escape(confirmPassowordText.text)}\$',
              updateMatch: updateValidRule,
            );
          },
        ),
      ],
    );
  }
}
