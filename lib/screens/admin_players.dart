import 'package:flutter/material.dart';
import 'package:kabadi_admin/components/playerCard.dart';
import 'package:kabadi_admin/components/top_bar.dart';

class AdminPlayers extends StatelessWidget {
  const AdminPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBar(),
          SizedBox(
            height: 10,
          ),
          Text(
              "Players",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
            ),
          AdminPlayerCard(),
        ],
      ),
    );
  }
}
