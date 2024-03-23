import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kabadi_admin/components/article_card.dart';
import 'package:kabadi_admin/components/top_bar.dart';
import 'package:kabadi_admin/responsive/mobilview/components/top_bar.dart';

class ArticlePage1 extends StatefulWidget {
  const ArticlePage1({super.key});

  @override
  State<ArticlePage1> createState() => _ArticlePage1State();
}

class _ArticlePage1State extends State<ArticlePage1> {
  @override
  Color matchesColor = Colors.white;
  Color teamsColor = Colors.white;
  Color playersColor = Colors.white;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const searchBar1(),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.deepOrangeAccent;
                                  }
                                  return matchesColor;
                                }),
                              ),
                              onPressed: () {
                                setState(() {
                                  matchesColor = Colors.deepOrangeAccent;
                                  teamsColor = Colors.white;
                                  playersColor = Colors.white;
                                });
                              },
                              child: Text(
                                "Kabaddi Matches",
                                style: TextStyle(
                                  color: matchesColor == Colors.deepOrangeAccent
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.deepOrangeAccent;
                                  }
                                  return teamsColor;
                                }),
                              ),
                              onPressed: () {
                                setState(() {
                                  matchesColor = Colors.white;
                                  teamsColor = Colors.deepOrangeAccent;
                                  playersColor = Colors.white;
                                });
                              },
                              child: Text(
                                "Kabaddi Teams",
                                style: TextStyle(
                                  color: teamsColor == Colors.deepOrangeAccent
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.deepOrangeAccent;
                                  }
                                  return playersColor;
                                }),
                              ),
                              onPressed: () {
                                setState(() {
                                  matchesColor = Colors.white;
                                  teamsColor = Colors.white;
                                  playersColor = Colors.deepOrangeAccent;
                                });
                              },
                              child: Text(
                                "Kabaddi Players",
                                style: TextStyle(
                                  color: playersColor == Colors.deepOrangeAccent
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 520,
                            ),
                            FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(Icons.add),
                              backgroundColor: Colors.deepOrangeAccent,
                              mini: true,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 540,
                        height: 1500,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ArticleCard(
                                imageUrl:
                                    'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9',
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
                              ArticleCard(
                                imageUrl:
                                    'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9',
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

                              ArticleCard(
                                imageUrl:
                                    'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9',
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
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 120,
                            height: 35,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrangeAccent),
                                ),
                                onPressed: () {},
                                child: const Text("Publish")),
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Article Views',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "View Request",
                                      style: TextStyle(color: Colors.purple),
                                    )),
                              ],
                            ),
                            const Text('from 1-6 feb 2024')
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200, // Set desired width
                          height: 200, // Set desired height
                          child: PieChartWidget(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10, // Set desired width
                                      height: 10, // Set desired height
                                      decoration: const BoxDecoration(
                                        color: Colors
                                            .deepPurple, // Set desired color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('Age < 18')
                                  ],
                                ),
                                const Text('30%'),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10, // Set desired width
                                      height: 10, // Set desired height
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple[
                                            300], // Set desired color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('Age 21- 25'),
                                  ],
                                ),
                                const Text('40%')
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10, // Set desired width
                                      height: 10, // Set desired height
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple[
                                            100], // Set desired color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('Age above 25')
                                  ],
                                ),
                                const Text('30%'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.deepPurple[300],
            value: 40,
            title: '40%',
          ),
          PieChartSectionData(
            color: Colors.deepPurple[100],
            value: 30,
            title: '30%',
          ),
          PieChartSectionData(
            color: Colors.deepPurple,
            value: 30,
            title: '30%',
          ),
        ],
      ),
    );
  }
}
