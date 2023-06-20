// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cicd_test/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cicd_test/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const LoginScreen());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.byWidget(const TextField()), findsWidgets);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.text('Login'));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });


  test('Empty email test ',(){
    var test = validEmail('');
    expect(test, 'Can\'t be a null');
  });

  test('Empty password test',(){
    var test = checkPassword('');
    expect(test, 'Can\'t be a null');
  });


  test('Valid email test ',(){
    var test = validEmail('anurag@gmail.com');
    expect(test, null);
  });

  test('Valid password test',(){
    var test = checkPassword('Anurag@123');
    expect(test, null);
  });
}


String? checkPassword(String text){
  final txt = text;
  if(txt.isEmpty){
    return'Can\'t be a null';
  }else if(!(RegExp(r'(?=.*?[A-Z])').hasMatch(txt))){
    return '!! Please enter a Uppercase letter';
  }
  else if(!(RegExp(r'(?=.*?[a-z])').hasMatch(txt))){
    return '!! Please enter at  Lowercase letter';
  }
  else if(!(RegExp(r'(?=.*?[0-9])').hasMatch(txt))){
    return '!! Please enter a numeric letter';
  }
  else if(!(RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(txt))){
    return '!! Please enter a special character ';
  }
  else if((RegExp(r'(?=.*?[\s])').hasMatch(txt))){
    return '!! Spaces is not allowed';
  }

  else if(txt.length<8){
    return "please enter min 8 characters";
  }else{
    return null;
  }
}

String? validEmail(String text){
  final txt = text;
  if(txt.isEmpty){
    return'Can\'t be a null';
  }else if((RegExp(r'(?=.*?[\s])').hasMatch(txt))){
    return '!! Spaces is not allowed';
  }
  else if(!RegExp(r'^[a-zA-Z0-9-._]+@[a-z]+\.[a-z]{2,3}$',).hasMatch(txt)){
    return "Please enter valid email";
  }else{
    return null;
  }
}
