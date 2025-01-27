
import 'package:flutter/material.dart';

class CounterHistoryProvider with ChangeNotifier{
     int _count=0;
     final List<int> _history=[];

   int get count=>_count;
  List<int> get history=> _history;

  //increment
  void increment(){
    _count++;
    _history.add(_count);
    notifyListeners();
  }
  //decrement
void decrement(){
    _count--;
    _history.add(_count);
    notifyListeners();
}

  //reset
void reset(){
  _count=0;
  _history.add(_count);
  notifyListeners();
}

}