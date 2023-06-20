
import 'package:cicd_test/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: LoginScreen(),
      ),
    );
    Finder emailField = find.byKey( const Key('email'));
    await tester.enterText(emailField, "text");
    await tester.enterText(emailField, "test@gmail.com");

    Finder passwordField = find.byKey(const Key('password'));
    await tester.enterText(passwordField, "text");
    await tester.enterText(passwordField, "Test@1123");

    Finder loginButton = find.byKey(const Key('login_btn'));
    await tester.tap(loginButton);
    await tester.pump();
  });
}

