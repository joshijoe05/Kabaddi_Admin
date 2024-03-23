import 'package:flutter/material.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_article.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_blog.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_dashboard.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_matches.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_players.dart';
import 'package:kabadi_admin/responsive/mobilview/screens/admin_teams.dart';

import 'package:sidebarx/sidebarx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const primaryColor = Color(0xFF6252DA);
const canvasColor = Color.fromARGB(255, 158, 157, 157);
const scaffoldBackgroundColor = Color(0xFF7777B6);

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const AdminDashBoard1();
                        case 1:
                          _key.currentState?.closeDrawer();
                          return const AdminBlogs1();
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const ArticlePage1();
                        case 3:
                          _key.currentState?.closeDrawer();
                          return const AdminTeamsPage1();
                        case 4:
                          _key.currentState?.closeDrawer();
                          return const AdminPlayers1();
                        case 5:
                          _key.currentState?.closeDrawer();
                          return const Matches1();

                        default:
                          return const AdminDashBoard1();
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0))),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedTextStyle:
            const TextStyle(color: Color.fromARGB(255, 252, 135, 2)),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size.width;
        return SizedBox(
          height: 100,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://th.bing.com/th/id/R.af077f1f49af54c3335c2c61b5a18975?rik=LUw1tydcnZOMkw&riu=http%3a%2f%2fwww.solidbackgrounds.com%2fimages%2f2048x2048%2f2048x2048-dark-blue-solid-color-background.jpg&ehk=gGp9X5bElQ5PqKRdRmZCkAnqpUXfKWeKW3YNSAp9HBM%3d&risl=&pid=ImgRaw&r=0',
                width: w * 0.08,
                height: h * 0.08,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.bar_chart_rounded, label: 'Admin'),
        SidebarXItem(icon: Icons.article, label: 'Blog'),
        SidebarXItem(icon: Icons.description, label: 'Article'),
        SidebarXItem(icon: Icons.people, label: 'Team'),
        SidebarXItem(icon: Icons.person, label: 'Player'),
        SidebarXItem(icon: Icons.sports_kabaddi, label: 'Matches'),
      ],
    );
  }
}
