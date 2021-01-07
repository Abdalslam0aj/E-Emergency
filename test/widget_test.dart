// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:E_Emergency/widgets/Classes/helpRequest.dart';
import 'package:E_Emergency/widgets/showIncomingHelpRequestLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:E_Emergency/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    HelpRequest hewlp =HelpRequest(civilianPhoneNumber: '089',description: 'ss',latitude: '31.232323',longitude: '30.223232',id: '1',numberOfHumans: 1,status: 'av');
    // Build our app and trigger a frame.
    await tester.pumpWidget(HelpLocation());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
