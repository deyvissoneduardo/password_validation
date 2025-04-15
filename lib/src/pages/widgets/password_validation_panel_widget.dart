import 'package:flutter/material.dart';

import '../../shared/colors_app.dart';
import 'password_dot_validation_widget.dart';

class PasswordValidationPanelWidget extends StatefulWidget {
  const PasswordValidationPanelWidget({super.key});

  @override
  State<PasswordValidationPanelWidget> createState() =>
      _PasswordValidationPanelWidgetState();
}

class _PasswordValidationPanelWidgetState
    extends State<PasswordValidationPanelWidget> {
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
          key: ValueKey(1),
          passwordValue: ValueNotifier(''),
          patternValidation: '',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: 'Uma letra maiuscula',
          key: ValueKey(2),
          passwordValue: ValueNotifier(''),
          patternValidation: '',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: 'um ou mais numero',
          key: ValueKey(4),
          passwordValue: ValueNotifier(''),
          patternValidation: '',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: 'uma ou mais letras',
          key: ValueKey(5),
          passwordValue: ValueNotifier(''),
          patternValidation: '',
          updateMatch: (key, match) {},
        ),
        PasswordDotValidationWidget(
          label: 'Senha igual ao confirmar senha',
          key: ValueKey(6),
          passwordValue: ValueNotifier(''),
          patternValidation: '',
          updateMatch: (key, match) {},
        ),
      ],
    );
  }
}
