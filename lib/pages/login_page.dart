// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/consts.dart';
import 'package:scholar_chat/pages/sign_up.dart';
import 'package:scholar_chat/widgets/pottons.dart';
import 'package:scholar_chat/widgets/text%20_field.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page'; // إضافة معرف ثابت للصفحة
  String? email;
  String? password;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
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
            SizedBox(height: 10),
            CustomText(
              onChanged: (data) {
                email = data;
              },
              hintText: 'email',
            ),
            SizedBox(height: 10),
            CustomText(
              onChanged: (data) {
                password = data;
              },
              hintText: 'password',
            ),
            const SizedBox(height: 10),
            CustomPotton(
              text: 'login ',
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
                    Navigator.pushNamed(
                      context,
                      SignPage.id,
                      arguments: {
                        'email': email ?? '',
                        'password': password ?? ''
                      },
                    );
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
    );
  }
}
