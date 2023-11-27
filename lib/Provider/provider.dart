import 'package:flutter/material.dart';

class operation extends ChangeNotifier {
  
  double _num2 = 0;
  double _result = 0;

  add() {
    _result = _result + _num2;
    notifyListeners();
  }

  subtract() {
    _result = _result - _num2;
    notifyListeners();
    
  }

  multiply() {
    _result = _result * _num2;
    notifyListeners();
  }

  divide() {
    _result = _result / _num2;
    notifyListeners();
  }

  AC() {
    _num2 = 0;
    _result = 0;
  }

  setResult(double num) {
    _result = num;
    
    notifyListeners();
  }

  setNum2(double num) {
    _num2 = num;
   
    notifyListeners();
  }

  double get getNum2 => _num2;
  double get getResult => _result;
}
