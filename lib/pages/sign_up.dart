// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import '../widgets/text _field.dart';

// ignore: must_be_immutable
class SignPage extends StatelessWidget {
  SignPage(this.email,this.password)  ;
  String id = 'signup';
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: ListView(
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
            const SizedBox(
              height: 10,
            ),
            CustomText(
              hintText: 'user name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
             
              hintText: 'phone',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              onChanged: (data) {
                password = data;
              },
              hintText: 'email',
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              hintText: 'password',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPotton(
              ontap: () {
                var auth = FirebaseAuth.instance;
                auth.createUserWithEmailAndPassword(
                    email: email, password: password);
              },
              text: 'sign up  ',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '  already have account',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage().id);
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
    );
  }
}
