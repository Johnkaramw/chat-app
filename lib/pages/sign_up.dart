// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import '../widgets/text _field.dart';

// ignore: must_be_immutable
class SignPage extends StatefulWidget {
  static const String id = 'sign_up'; // إضافة معرف ثابت للصفحة

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Form(
            key: formKey,
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
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await signup();
                        snackbar(context, 'Success email');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          snackbar(context, 'Weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          snackbar(context, 'Email already in use');
                        }
                      } catch (ex) {
                        snackbar(context, 'Error occurred');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  text: 'sign up',
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, LoginPage);
                      },
                      child: const Text(
                        'login',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
