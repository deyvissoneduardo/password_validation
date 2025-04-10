import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/shared/custom_textfield.dart';
import 'package:password_validation/src/shared/custom_textfield_pwd.dart';

void main() {
  group('TextFieldPWD | ', () {
    testWidgets('Render CustomTextField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(CustomTextfield), findsOne);
    });

    testWidgets('Render label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Label Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsOne);
      expect(find.text('Label Teste'), findsOne);
    });

    testWidgets('Render obscuretext isTrue', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Label Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });

    testWidgets('Render suffixIcon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Label Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      TextField getTextField() {
        return tester.widget<TextField>(find.byType(TextField));
      }

      expect(getTextField().obscureText, isTrue);
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(getTextField().obscureText, isFalse);
      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();
      expect(getTextField().obscureText, isTrue);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });
  });
}
