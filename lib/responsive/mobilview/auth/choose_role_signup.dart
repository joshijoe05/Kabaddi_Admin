import 'package:flutter/material.dart';
import 'package:kabadi_admin/auth/sign_upAdmin.dart';
import 'package:kabadi_admin/auth/sign_upRefree.dart';
import 'package:kabadi_admin/responsive/mobilview/auth/sign_upAdmin1.dart';
import 'package:kabadi_admin/responsive/mobilview/auth/sign_upReferee1.dart';

class ChooseRole1 extends StatefulWidget {
  const ChooseRole1({super.key});

  @override
  State<ChooseRole1> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole1> {
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
                  MaterialPageRoute(builder: (context) => const SignUpAdmin1()),
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
                  MaterialPageRoute(
                      builder: (context) => const SignUpReferee1()),
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
