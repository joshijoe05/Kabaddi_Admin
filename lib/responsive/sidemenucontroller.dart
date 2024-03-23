import 'package:flutter/material.dart';

class SideMenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffolKey => _scaffoldkey;
  void controllmenu() {
    if (!_scaffoldkey.currentState!.isDrawerOpen) {
      _scaffoldkey.currentState!.openDrawer();
    }
  }
}
