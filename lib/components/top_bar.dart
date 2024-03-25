import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/responsive/home.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 60,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 22,
                child: TextField(
                  // controller: _controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 100),
                    hintText: 'Search',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: MediaQuery.of(context).size.width / 75,
                      onPressed: () {
                        // Perform search operation here
                        //   String searchText = _controller.text;
                        //   print('Searching for: $searchText');
                        // You can implement search functionality here
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 190, 138, 138)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3),
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3),
                          bottomRight: Radius.circular(3)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 7.3,
                top: MediaQuery.of(context).size.height / 30),
            child: Row(
              children: [
                IconButton(
                    iconSize: MediaQuery.of(context).size.width / 72,
                    onPressed: () {},
                    icon: const Icon(Icons.question_mark_rounded)),
                IconButton(
                    iconSize: MediaQuery.of(context).size.width / 72,
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded)),
                Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(() => const Home());
                      },
                      child: const Text(
                        "LOGOUT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
