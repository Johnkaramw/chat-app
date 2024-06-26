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

  SignPage({required this.email, required this.password});

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
                var auth = FirebaseAuth.instance;
                try {
                  await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                } catch (e) {
                  print(e);
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
    );
  }
}
