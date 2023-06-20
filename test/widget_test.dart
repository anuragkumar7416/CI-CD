// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cicd_test/login.dart';
import 'package:cicd_test/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cicd_test/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: LoginScreen(),
      ),
    );
    Finder emailField = find.byKey( Key('email'));
    await tester.enterText(emailField, "text");
    await tester.enterText(emailField, "test@gmail.com");

    Finder passwordField = find.byKey(new Key('password'));
    await tester.enterText(passwordField, "text");
    await tester.enterText(passwordField, "Test@1123");

    Finder loginButton = find.byKey(new Key('login_btn'));
    await tester.tap(loginButton);
    await tester.pump();
  });
}

