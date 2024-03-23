import 'package:flutter/material.dart';
import 'package:kabadi_admin/auth/loginAdmin.dart';
import 'package:kabadi_admin/auth/loginReferee.dart';
import 'package:kabadi_admin/auth/sign_upAdmin.dart';
import 'package:kabadi_admin/auth/sign_upRefree.dart';

class ChooseRoleLogin extends StatefulWidget {
  const ChooseRoleLogin({super.key});

  @override
  State<ChooseRoleLogin> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRoleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginAdmin()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFFfc5607),
                foregroundColor: Colors.white,
              ),
              child: const Text('Admin'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginReferee()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFFfc5607),
                foregroundColor: Colors.white,
              ),
              child: const Text('Referee'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
