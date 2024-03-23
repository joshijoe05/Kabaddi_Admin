import 'package:flutter/material.dart';
import 'package:kabadi_admin/auth/choose_role_login.dart';

import 'package:kabadi_admin/auth/choose_role_signup.dart';

import 'package:kabadi_admin/responsive/mobilview/auth/choose_role_login.dart';
import 'package:kabadi_admin/responsive/mobilview/auth/choose_role_signup.dart';
import 'package:kabadi_admin/responsive/mobilview/auth/loginAdmin.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              'images/captain.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Kabadi',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFfc5607),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseRole1()),
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
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseRoleLogin1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
