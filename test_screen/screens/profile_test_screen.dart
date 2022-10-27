import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'general_test_screen.dart';

/// Экран персональных данных
abstract class ProfileTestScreen {
  /// поле Surname на экране персональных данных
  static Finder surnameField = GeneralTestScreen.textField('Surname');

  /// поле Name на экране персональных данных
  static Finder nameField = GeneralTestScreen.textField('Name');

  /// поле SecondName на экране персональных данных
  static Finder secondNameField = GeneralTestScreen.textField('SecondName');

  /// поле Birthday на экране персональных данных
  static Finder birthdayField = GeneralTestScreen.textField('Birthday');

  /// поле Place of residence на экране выбора города
  static Finder placeOfResidenceField =
      GeneralTestScreen.textField('Place of residence');

  /// поле About Me на экране рассказа о себе
  static Finder aboutMeField =
      GeneralTestScreen.textField('Write a few words about yourself');

  /// Interests на экране выбора интересов
  static Finder interest = find.descendant(
    of: find.ancestor(of: find.byType(Checkbox), matching: find.byType(Row)),
    matching: find.byType(Text),
  );

  /// информация о себе
  static Finder bio = GeneralTestScreen.textField('Write a few words about yourself');


  /// кнопка перехода на следующий экран на экране персональных данных
  static Finder save = find.widgetWithText(ElevatedButton, 'Save');

  /// чекбокс интереса соответствующий тексту [t]
  static Finder interestCheckbox(String t) => find.descendant(
    of: find.ancestor(of: find.text(t), matching: find.byType(Row)),
    matching: find.byType(Checkbox),
  );
}
