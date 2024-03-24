import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/components/article_card.dart';
import 'package:kabadi_admin/components/top_bar.dart';
import 'package:kabadi_admin/database/article_services.dart';
import 'package:kabadi_admin/screens/article_form.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Color matchesColor = Colors.white;
  Color teamsColor = Colors.white;
  Color playersColor = Colors.white;
  Stream? articleStream;

  final ArticleController _articleController = Get.put(ArticleController());

  getData() async {
    articleStream = await _articleController.getAllArticles();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const searchBar(),
            const SizedBox(
              height: 10,
            ),
            Row(
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
                            onPressed: () async {
                              articleStream = await _articleController
                                  .getArticlesByTopic("Kabaddi Matches");
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
                            onPressed: () async {
                              articleStream = await _articleController
                                  .getArticlesByTopic("Kabaddi Teams");
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
                            onPressed: () async {
                              articleStream = await _articleController
                                  .getArticlesByTopic("Kabaddi Players");
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleFormScreen(),
                                  ));
                            },
                            child: const Icon(Icons.add),
                            backgroundColor: Colors.deepOrangeAccent,
                            mini: true,
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return _articleController.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              width: 540,
                              child: StreamBuilder(
                                  stream: articleStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            if (snapshot.data.docs.length > 0)
                                              for (int i = 0;
                                                  i < snapshot.data.docs.length;
                                                  i++)
                                                ArticleCard(
                                                  imageUrl: snapshot
                                                      .data.docs[i]["imageUrl"],
                                                  title: snapshot.data.docs[i]
                                                      ["title"],
                                                  description: snapshot.data
                                                      .docs[i]["description"],
                                                  onEditPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ArticleFormScreen(
                                                            doc: snapshot
                                                                .data.docs[i],
                                                          ),
                                                        ));
                                                  },
                                                  onDeletePressed: () async {
                                                    await _articleController
                                                        .deleteArticle(snapshot
                                                            .data
                                                            .docs[i]["id"]);
                                                  },
                                                ),
                                            if (snapshot.data.docs.length == 0)
                                              Center(
                                                child: Text("No articles yet"),
                                              )
                                          ],
                                        ),
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Center(
                                        child: Text("Internal Error Occured"),
                                      );
                                    }
                                  }),
                            );
                    }),
                  ],
                ),
                Container(
                  width: 400,
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Container(
                      //     width: 120,
                      //     height: 35,
                      //     child: ElevatedButton(
                      //         style: ButtonStyle(
                      //           backgroundColor:
                      //               MaterialStateProperty.all<Color>(
                      //                   Colors.deepOrangeAccent),
                      //         ),
                      //         onPressed: () {},
                      //         child: const Text("Publish")),
                      //   ),
                      // ),
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
                                      color: Colors
                                          .deepPurple[300], // Set desired color
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
                                      color: Colors
                                          .deepPurple[100], // Set desired color
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
