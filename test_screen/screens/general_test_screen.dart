import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class GeneralTestScreen {
  /// текстовое поле [TextField] по подсказке или хинту [hint]. Строгое соответствие
  static Finder textField(String hint) => find.byWidgetPredicate((widget) {
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });

  static Finder interests(String hint) => find.byWidgetPredicate((widget) {
        if (widget is Row) {
          var child = widget.children;
          for(int i = 0; i < child.length; i++ ){
            child.iterator.current;
            var current = child[i];
            if(current is Text && current.data == hint){
            }
          }
        }
        return widget is TextField &&
            ((widget.decoration?.labelText == hint) ||
                (widget.decoration?.hintText == hint));
      });

  /// кнопка перехода на следующий экран
  static Finder nextProfileBtn =
      find.widgetWithIcon(ElevatedButton, Icons.navigate_next);

  /// кнопка сохранения результата редактирования профиля
  static Finder saveProfileBtn = find.widgetWithText(ElevatedButton, 'Save');
}
