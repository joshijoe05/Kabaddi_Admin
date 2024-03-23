import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kabadi_admin/screens/admin_article.dart';
import 'package:kabadi_admin/screens/admin_blog.dart';
import 'package:kabadi_admin/screens/admin_dashboard.dart';
import 'package:kabadi_admin/screens/admin_matches.dart';
import 'package:kabadi_admin/screens/admin_players.dart';
import 'package:kabadi_admin/screens/admin_teams.dart';

void main() {
  runApp(AdminSideBar());
}

class AdminSideBar extends StatefulWidget {
  @override
  _AdminSideBarState createState() => _AdminSideBarState();
}

class _AdminSideBarState extends State<AdminSideBar> {
  String _selectedMenu = '';
  Widget selectedPage = const AdminDashBoard();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Material(
      child: Row(
        children: [
          SizedBox(
            //flex: 1,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: Image.network(
                              'https://th.bing.com/th/id/R.af077f1f49af54c3335c2c61b5a18975?rik=LUw1tydcnZOMkw&riu=http%3a%2f%2fwww.solidbackgrounds.com%2fimages%2f2048x2048%2f2048x2048-dark-blue-solid-color-background.jpg&ehk=gGp9X5bElQ5PqKRdRmZCkAnqpUXfKWeKW3YNSAp9HBM%3d&risl=&pid=ImgRaw&r=0',
                              width: w * 0.04,
                              height: h * 0.08,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: w *
                                0.01), // Adjust the spacing between image and text
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            '  LOGO',
                            style: TextStyle(
                              fontSize: w * 0.013,
                              color: const Color.fromARGB(255, 11, 69, 117),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: w * 0.012,
                        //   foColor.fromRGBO(0, 0, 0, 0.451)Weight.bold,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  _buildMenuItem('Admin', Icons.bar_chart_rounded,
                      const AdminDashBoard(), context),
                  _buildMenuItem(
                      'Blog', Icons.article, const AdminBlogs(), context),
                  _buildMenuItem('Article', Icons.description,
                      const ArticlePage(), context),
                  _buildMenuItem(
                      'Team', Icons.people, const AdminTeamsPage(), context),
                  _buildMenuItem(
                      'Player', Icons.person, const AdminPlayers(), context),
                  _buildMenuItem('Matches', Icons.sports_kabaddi,
                      const Matches(), context),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: selectedPage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData iconData, Widget currentPage,
      BuildContext context) {
    bool isSelected = title == _selectedMenu;
    // double  w(BuildContext context) => MediaQuery.of(context).size.width;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMenu = title;
          selectedPage = currentPage;
        });
      },
      child: Container(
        color: isSelected ? const Color(0xFFfe4d00) : Colors.transparent,
        child: ListTile(
          leading: Icon(
            iconData,
            size: w * 0.018,
            color: isSelected ? Colors.white : Colors.black45,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black45,
              fontSize: w * 0.014,
              fontWeight: FontWeight.bold,
            ),
          ),
          // trailing:
          //     title == 'Matches' ? Expanded(child: _buildDropDownMenu()) : null,
        ),
      ),
    );
  }

  // Widget _buildDropDownMenu() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       DropdownButton<String>(
  //         items: const [
  //           DropdownMenuItem(
  //             value: 'Option 1',
  //             child: Text('Option 1'),
  //           ),
  //           DropdownMenuItem(
  //             value: 'Option 2',
  //             child: Text('Option 2'),
  //           ),
  //           DropdownMenuItem(
  //             value: 'Option 3',
  //             child: Text('Option 3'),
  //           ),
  //         ],
  //         onChanged: (String? value) {
  //           print('Selected: $value');
  //           // Perform any action on selection if needed
  //         },
  //       ),
  //     ],
  //   );
  // }
}
