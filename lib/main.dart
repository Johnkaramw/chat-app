import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      onGenerateRoute: (settings) {
        if (settings.name == LoginPage.id) {
          return MaterialPageRoute(builder: (context) => LoginPage());
        } else if (settings.name == SignPage.id) {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) =>
                SignPage(email: args['email']!, password: args['password']!),
          );
        }
        return null;
      },
    );
  }
}
