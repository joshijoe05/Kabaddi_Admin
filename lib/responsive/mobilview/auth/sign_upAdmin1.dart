import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kabadi_admin/responsive/sidebarx.dart';
import 'package:kabadi_admin/screens/admin_sidebar.dart';

class SignUpAdmin1 extends StatefulWidget {
  const SignUpAdmin1({super.key});

  @override
  State<SignUpAdmin1> createState() => _SignUpAdmin1State();
}

class _SignUpAdmin1State extends State<SignUpAdmin1> {
  final _firebase = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  var _enteredUsername = '';
  var _enteredEmail = '';
  var _enteredPhone = '';
  var _enteredPassword = '';

  String _password = '';
  String _confirmPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      return;
    }

    _formKey.currentState!.save();

    try {
      final UserCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
      //  _firebase.createUserWithEmailAndPassword(
      //     email: _enteredEmail, password: _enteredPassword);
      await FirebaseFirestore.instance
          .collection('Admin')
          .doc(UserCredentials.user?.uid)
          .set({
        'role': 'admin',
        'username': _enteredUsername,
        'email': _enteredEmail,
        'phone': _enteredPhone,
        'password': _enteredPassword
      });

      print(UserCredentials);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        //
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'Kabadi',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFfc5607),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFfc5607),
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter valid username';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredUsername = value!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2C3546),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'please enter valid Email Id';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2C3546),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.length != 10) {
                                  return 'please enter valid mobile number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredPhone = value!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.key_sharp),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF2C3546),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFfc5607)),
                                ),
                              ),
                              obscureText: true,
                              onChanged: (value) {
                                _password = value;
                              },
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'Password is required please enter';
                                }
                                // you can check password length and specifications

                                return null;
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            const SizedBox(height: 25),
                            TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.key_sharp),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF2C3546),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFfc5607)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFfc5607)),
                                  ),
                                ),
                                obscureText: true,
                                onChanged: (value) {
                                  _confirmPassword = value;
                                },
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Conform password is required please enter';
                                  }
                                  if (value != _password) {
                                    return 'Confirm password not matching';
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFfc5607), // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 12),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 26,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
