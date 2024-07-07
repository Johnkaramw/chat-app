// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/pages/sign_up.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import 'package:scholar_chat/widgets/text%20_field.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'loginPage'; // Route ID for LoginPage

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool inLoading = false;
  final GlobalKey<FormState> logKey = GlobalKey();

  // Defining variables

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Form(
            key: logKey,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'App Chat',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                  ),
                ),
                const Spacer(flex: 2),
                const Row(
                  children: [
                    Text(
                      '   LOGIN ',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomText(
                  hintText: 'email',
                  onChanged: (data) {
                    setState(() {
                      email = data;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CustomText(
                  hintText: 'password',
                  onChanged: (data) {
                    setState(() {
                      password = data;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CustomPotton(
                  ontap: () async {
                    if (logKey.currentState!.validate()) {
                      setState(() {
                        inLoading = true;
                      });
                      try {
                        await login();
                        snackbar(context, 'Login successful');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          snackbar(context, 'User not found');
                        } else if (ex.code == 'wrong-password') {
                          snackbar(context, 'Incorrect password');
                        }
                      } catch (ex) {
                        snackbar(context, 'An error occurred');
                      }
                      setState(() {
                        inLoading = false;
                      });
                    }
                  },
                  text: 'login',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account! ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignPage.id);
                      },
                      child: const Text(
                        '   sign up',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
