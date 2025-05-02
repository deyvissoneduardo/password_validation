import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/pages/widgets/password_validation_panel_widget.dart';

void main() {
  group('Passoword Validation Panel |', () {
    late final TextEditingController passwordController;
    late final TextEditingController confirmPasswordController;
    late bool passwordValid;

    setUp(() {
      passwordController = TextEditingController();
      confirmPasswordController = TextEditingController();
      passwordValid = false;
    });

    Future<void> pumpWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidationPanelWidget(
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              passwordValid: (valid) {
                passwordValid = valid;
              },
            ),
          ),
        ),
      );
    }

    testWidgets('Cenario 01: senha valida', (tester) async {
      await pumpWidget(tester);
      passwordController.text = 'Senha01Valida!';
      confirmPasswordController.text = 'Senha01Valida!';
      await tester.pump();

      expect(passwordValid, isTrue);
    });

    testWidgets('Cenario 02: senha invalida', (tester) async {
      await pumpWidget(tester);
      passwordController.text = 'Senha1!';
      confirmPasswordController.text = 'Senha1!';
      await tester.pump();

      expect(passwordValid, isTrue);
    });
  });

  
}
