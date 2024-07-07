import 'package:flutter/material.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/sign_up.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'loginPage': (context) => LoginPage(),
        'signPage': (context) => SignPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
