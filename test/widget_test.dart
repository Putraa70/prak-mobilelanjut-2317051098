// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('MoLaApp smoke test', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame pertama
    await tester.pumpWidget(const MoLaApp());

    // Cek kalau ada teks "Welcome Back 👋" dari LoginScreen
    expect(find.text('Welcome Back 👋'), findsOneWidget);

    // Cek tombol login muncul
    expect(find.text('Login'), findsOneWidget);
  });
}
