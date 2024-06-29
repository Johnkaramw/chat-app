// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/pages/sign_up.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import 'package:scholar_chat/widgets/text%20_field.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  final String email;
  final String password;

  LoginPage({required this.email, required this.password});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool inloding = false;
  GlobalKey<FormState> logkye = GlobalKey();

  // تعريف المتغيرات لتحديث القيم المدخلة
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    // تهيئة المتغيرات بالقيم الممررة من الويدجت
    email = widget.email;
    password = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ModalProgressHUD(
        inAsyncCall: inloding,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Form(
              key: logkye,
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
                      email = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    hintText: 'password',
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomPotton(
                    ontap: () async {
                      FirebaseAuth.instance;
                      if (logkye.currentState!.validate()) {
                        inloding = true;
                        setState(() {});
                        try {
                          await login();
                          snackbar(context, 'success email');
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'pleas create email') {
                            snackbar(context, 'please create email');
                          } else if (ex.code ==
                              'the email already not use in') {
                            snackbar(context, 'the email already not use in');
                          }
                        } catch (ex) {
                          snackbar(context, 'not found email or password');
                        }
                        inloding = false;
                        setState(() {});
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(height: 10),
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
    });
  }

  void snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> login() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
