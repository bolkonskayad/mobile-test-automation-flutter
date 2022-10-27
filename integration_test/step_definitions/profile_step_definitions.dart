import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../../test_screen/screens/general_test_screen.dart';
import '../../test_screen/screens/profile_test_screen.dart';

abstract class ProfileStepDefinitions {
  static Iterable<StepDefinitionGeneric> get steps => [
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю фамилию {string}$'),
          (surname, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.surnameField, surname);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю имя {string}$'),
          (name, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.nameField, name);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю отчество {string}$'),
          (secondName, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(
                ProfileTestScreen.secondNameField, secondName);
            await tester.pump();
            await tester.testTextInput.receiveAction(TextInputAction.done);
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я указываю дату рождения {string}$'),
          (birthdate, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            tester
                .widget<TextField>(ProfileTestScreen.birthdayField)
                .controller
                ?.text = birthdate;
            await tester.pump();
          },
        ),
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я перехожу далее$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);

            await tester.pumpAndSettle();
            await tester.tap(GeneralTestScreen.nextProfileBtn);
            await tester.pump();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я выбираю город {string}$'),
          (city, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(
                ProfileTestScreen.placeOfResidenceField, city);
            await tester.pump();
            FocusScope.of(
                    tester.element(ProfileTestScreen.placeOfResidenceField))
                .unfocus();
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'Я выбираю {string} из интересов$'),
          (interest, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            if (!(tester
                    .widget<Checkbox>(
                        ProfileTestScreen.interestCheckbox(interest))
                    .value ??
                false)) {
              await tester.tap(ProfileTestScreen.interestCheckbox(interest),
                  warnIfMissed: false);
            }
          },
        ),
        when1<String, FlutterWidgetTesterWorld>(
          RegExp(r'И Я заполняю заметку о себе {string}$'),
          (bio, context) async {
            final tester = context.world.rawAppDriver;
            await tester.pumpAndSettle();
            await tester.enterText(ProfileTestScreen.bio, bio);
            await tester.pump();
          },
        ),
        when<FlutterWidgetTesterWorld>(
          RegExp(r'Я сохраняю профиль$'),
          (context) async {
            final tester = context.world.rawAppDriver;
            await tester.tap(ProfileTestScreen.save);
          },
        ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненные поля ФИО$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        expect(find.text('Chibisova'), findsOneWidget);
        expect(find.text('Diana'), findsOneWidget);
        expect(find.text('Olegovna'), findsOneWidget);
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненное поле даты рождения$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        expect(find.text('2001-12-26'), findsOneWidget);
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненное поле города$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        expect(find.text('Moscow'), findsOneWidget);
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу выбранные интересы$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
      },
    ),
    when<FlutterWidgetTesterWorld>(
      RegExp(r'Я вижу заполненное поле заметки о себе$'),
          (context) async {
        final tester = context.world.rawAppDriver;
        await tester.pumpAndSettle();
        expect(find.text('Тестовая заметка о себе'), findsOneWidget);
      },
    ),
      ];
}
