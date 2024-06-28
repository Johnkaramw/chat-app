// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import '../widgets/text _field.dart';

// ignore: must_be_immutable
class SignPage extends StatelessWidget {
  static const String id = 'sign_up'; // إضافة معرف ثابت للصفحة
  final String email;
  final String password;
  GlobalKey<FormState> formkye = GlobalKey();
  SignPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Form(
          key: formkye,
          child: Column(
            children: [
              Image.asset('assets/images/scholar.png'),
              const Row(
                children: [
                  Text(
                    'sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomText(
                hintText: 'email',
                onChanged: (data) {
                  // لست بحاجة لتحديث email هنا لأنه يتم تمريره كباني
                },
              ),
              const SizedBox(height: 10),
              CustomText(
                hintText: 'password',
                onChanged: (data) {
                  // لست بحاجة لتحديث password هنا لأنه يتم تمريره كباني
                },
              ),
              const SizedBox(height: 10),
              CustomPotton(
                ontap: () async {
                  FirebaseAuth.instance;
                  if (formkye.currentState!.validate()) {
                    try {
                      await signup();
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'wak password') {
                        snackbar(context, 'wak password');
                      } else if (ex.code == 'the email already ues') {
                        snackbar(context, 'the email alraedy use in');
                      }
                    } catch (ex) {
                      snackbar(context, 'not found email or password');
                    }
                    snackbar(context, ' success email');
                  }
                },
                text: 'sign up  ',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '  already have an account',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: const Text(
                      '  login',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> signup() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
