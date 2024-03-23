import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class searchBar1 extends StatefulWidget {
  const searchBar1({super.key});

  @override
  State<searchBar1> createState() => _searchBar1State();
}

class _searchBar1State extends State<searchBar1> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                      fontSize: MediaQuery.of(context).size.width / 50),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    iconSize: MediaQuery.of(context).size.width / 40,
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
              left: MediaQuery.of(context).size.width / 6,
              top: MediaQuery.of(context).size.height / 30),
          child: Row(
            children: [
              IconButton(
                  iconSize: MediaQuery.of(context).size.width / 40,
                  onPressed: () {},
                  icon: const Icon(Icons.question_mark_rounded)),
              IconButton(
                  iconSize: MediaQuery.of(context).size.width / 40,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_rounded)),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 45,
                  child: ClipOval(child: Image.asset('assets/images/b.png')),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
