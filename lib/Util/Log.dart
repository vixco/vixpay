import 'package:flutter/material.dart';

class Log{
  static d(String tag,String message){
    debugPrint("D:[$tag]  $message");
  }
  static w(String tag,String message){
    debugPrint("W:[$tag]  $message");
  }
  static e(String tag,String message){
    debugPrint("E:[$tag]  $message");
  }
  static i(String tag,String message){
    debugPrint("I:[$tag]  $message");
  }
}