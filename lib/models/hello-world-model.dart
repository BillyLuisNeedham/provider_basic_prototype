import 'package:flutter/material.dart';

class HelloWorldModel with ChangeNotifier {
  static const String _hello = "Hello World";
  static const String _goodbye = "Goodbye World\n(bit melodramatic)";

  String displayMessage = _hello;


  void updateDisplayMessage() {
    if (displayMessage == _hello) {
      _sayGoodbye();
    } else {
      _sayHello();
    }
    notifyListeners();
  }

  void _sayGoodbye() {
    displayMessage = _goodbye;
  }

  void _sayHello() {
    displayMessage = _hello;
  }
}
