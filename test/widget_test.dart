import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/controllers/news_controller.dart';

import 'package:news_app/view/login/login_page.dart';
import 'package:news_app/view/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  
  testWidgets('Login screen displays correctly', (WidgetTester tester) async {
    // Build the LoginScreen widget with NewsController provider.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsController()),
        ],
        child: const MaterialApp(home: LoginScreen()),
      ),
    );
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsController()),
        ],
        child: const MaterialApp(home: LoginScreen()),
      );
    

  

    // Verify that the email and password fields are displayed.
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the login button is displayed.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });


  testWidgets('Login form validation works', (WidgetTester tester) async {
    // Build the LoginScreen widget.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Tap the login button without entering any data.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that validation messages are displayed.
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);

    // Enter invalid email and password.
    await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
    await tester.enterText(find.byType(TextFormField).last, 'password');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that validation messages are displayed.
    expect(find.text('Please enter a valid email'), findsOneWidget);
    expect(find.text('Password must contain at least 8 characters, including uppercase, lowercase, number, and symbol'), findsOneWidget);
  });

  testWidgets('Successful login navigates to home screen', (WidgetTester tester) async {
    // Build the LoginScreen widget.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Enter valid email and password.
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'Password1!');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    

    // Verify that the HomePage is displayed.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}