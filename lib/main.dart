import 'package:flutter/material.dart';
import 'package:kabadi_admin/firebase_options.dart';
import 'package:kabadi_admin/responsive.dart';
import 'package:kabadi_admin/responsive/home.dart';
import 'package:kabadi_admin/responsive/sidebarx.dart';
import 'package:kabadi_admin/screens/admin_sidebar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: KabadiAdmin()));
}

class KabadiAdmin extends StatelessWidget {
  const KabadiAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // body: Responsive(
      //   desktop: AdminSideBar(),
      //   mobile: AdminSideBar(),
      // ),
      // body: Home(),
      // body: Home(),
      body: Home(),
    );
  }
}
