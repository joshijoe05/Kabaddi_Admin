import 'package:flutter/material.dart';
import 'package:kabadi_admin/components/blog_card.dart';

class RecentBlogs1 extends StatefulWidget {
  const RecentBlogs1({Key? key}) : super(key: key);

  @override
  State<RecentBlogs1> createState() => _RecentBlogs1State();
}

class _RecentBlogs1State extends State<RecentBlogs1> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Blogs",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.02),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: w * 0.02,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(fontSize: w * 0.02),
                      ),
                    ],
                  )),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BlogCard(
                  imageUrl:
                      'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9', // Replace with actual image URL
                  title:
                      'Maninder Leads the raiding department for bengal warriors picked up 9 raid points in his previous appearance.',
                  description:
                      'Kabaddi, a traditional sport originating from ancient India, involves two '
                      'teams vying '
                      'for supremacy on a rectangular field divided into halves. Each team, comprising'
                      ' seven players, '
                      'takes turns sending a raider into the opponent\'s territory, aiming to tag defenders and return safely.'
                      ' The raider must chant "kabaddi, kabaddi" without interruption and complete the raid within a single '
                      'breath. Points are scored by successful raids or tackles, showcasing a blend of strength, agility, '
                      'and strategy. Kabaddi has garnered global attention, especially in South Asia, with professional'
                      ' leagues like the Pro Kabaddi League (PKL) in India attracting widespread viewership. Despite its '
                      'traditional roots, efforts are underway to promote Kabaddi internationally, with countries such as Iran, South Korea,'
                      ' and Japan embracing the sport with growing enthusiasm.',
                  onEditPressed: () {
                    // Handle edit button press
                    print('Edit button pressed');
                  },
                  onDeletePressed: () {
                    // Handle delete button press
                    print('Delete button pressed');
                  },
                ),
              ],
            ),
          ),

          BlogCard(
            imageUrl:
                'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9', // Replace with actual image URL
            title:
                'Maninder Leads the raiding department for bengal warriors picked up 9 raid points in his previous appearance.',
            description:
                'Kabaddi, a traditional sport originating from ancient India, involves two '
                'teams vying '
                'for supremacy on a rectangular field divided into halves. Each team, comprising'
                ' seven players, '
                'takes turns sending a raider into the opponent\'s territory, aiming to tag defenders and return safely.'
                ' The raider must chant "kabaddi, kabaddi" without interruption and complete the raid within a single '
                'breath. Points are scored by successful raids or tackles, showcasing a blend of strength, agility, '
                'and strategy. Kabaddi has garnered global attention, especially in South Asia, with professional'
                ' leagues like the Pro Kabaddi League (PKL) in India attracting widespread viewership. Despite its '
                'traditional roots, efforts are underway to promote Kabaddi internationally, with countries such as Iran, South Korea,'
                ' and Japan embracing the sport with growing enthusiasm.',
            onEditPressed: () {
              // Handle edit button press
              print('Edit button pressed');
            },
            onDeletePressed: () {
              // Handle delete button press
              print('Delete button pressed');
            },
          ),
          BlogCard(
            imageUrl:
                'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9', // Replace with actual image URL
            title:
                'Maninder Leads the raiding department for bengal warriors picked up 9 raid points in his previous appearance.',
            description:
                'Kabaddi, a traditional sport originating from ancient India, involves two '
                'teams vying '
                'for supremacy on a rectangular field divided into halves. Each team, comprising'
                ' seven players, '
                'takes turns sending a raider into the opponent\'s territory, aiming to tag defenders and return safely.'
                ' The raider must chant "kabaddi, kabaddi" without interruption and complete the raid within a single '
                'breath. Points are scored by successful raids or tackles, showcasing a blend of strength, agility, '
                'and strategy. Kabaddi has garnered global attention, especially in South Asia, with professional'
                ' leagues like the Pro Kabaddi League (PKL) in India attracting widespread viewership. Despite its '
                'traditional roots, efforts are underway to promote Kabaddi internationally, with countries such as Iran, South Korea,'
                ' and Japan embracing the sport with growing enthusiasm.',
            onEditPressed: () {
              // Handle edit button press
              print('Edit button pressed');
            },
            onDeletePressed: () {
              // Handle delete button press
              print('Delete button pressed');
            },
          ),

          // Add more BlogCard widgets if needed
        ],
      ),
    );
  }
}
