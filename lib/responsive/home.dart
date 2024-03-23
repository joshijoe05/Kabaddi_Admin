import 'package:flutter/material.dart';
import 'package:kabadi_admin/auth/landing_page.dart';
import 'package:kabadi_admin/responsive.dart';

import 'package:kabadi_admin/responsive/mobilview/auth/landing_page.dart';
import 'package:kabadi_admin/responsive/sidebarx.dart';

import 'package:kabadi_admin/screens/admin_dashboard.dart';
import 'package:kabadi_admin/screens/admin_sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: LandingPage(),
              ),
            if (!Responsive.isDesktop(context))
              Expanded(
                child: LandingPage1(),
              )
            //const Expanded(flex: 3, child: DashBoard())
          ],
        ),
      ),
    );
  }
}
