import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';

class MockUpdateMatchCallback extends Mock {
  void call(ValueKey<int> key, bool match);
}

void main() {
  group('TEST DOT PAGE | ', () {
    testWidgets('Teste sucesso quando senha correta', (
      WidgetTester tester,
    ) async {
      final mockMatchUpdate = MockUpdateMatchCallback();

      registerFallbackValue(ValueKey<int>(0));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: ValueKey(1),
              label: 'Somente numero',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('123456'),
              updateMatch: mockMatchUpdate.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));
      expect(checked.visible, isTrue);

      verify(() => mockMatchUpdate.call(ValueKey(1), true)).called(1);
    });

    testWidgets('Teste sucesso quando senha incorreta', (
      WidgetTester tester,
    ) async {
      final mockMatchUpdate = MockUpdateMatchCallback();

      registerFallbackValue(ValueKey<int>(0));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: ValueKey(1),
              label: 'Somente numero',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('asd123'),
              updateMatch: mockMatchUpdate.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));
      expect(checked.visible, isFalse);

      verify(() => mockMatchUpdate.call(ValueKey(1), false)).called(1);
    });
  });
}
