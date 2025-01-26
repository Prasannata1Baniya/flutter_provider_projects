
import 'package:flutter/material.dart';

class CounterHistoryProvider with ChangeNotifier{
     int _count=0;
    final List<int> _incrementHistory = [];
     final List<int> _decrementHistory = [];
     final List<int> _resetHistory = [];

   int get count=>_count;
  List<int> get incrementHistory=> _incrementHistory;
     List<int> get decrementHistory=> _decrementHistory;
     List<int> get resetHistory=> _resetHistory;


  //increment
  void increment(){
    _count++;
    _incrementHistory.add(_count);
    notifyListeners();
  }
  //decrement
void decrement(){
    _count--;
    _decrementHistory.add(_count);
    notifyListeners();
}

  //reset
void reset(){
  _count=0;
  _resetHistory.add(_count);
  notifyListeners();
}

}