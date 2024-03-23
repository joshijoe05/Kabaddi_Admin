import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';

class BlogAnalytics1 extends StatefulWidget {
  const BlogAnalytics1({super.key});

  @override
  State<BlogAnalytics1> createState() => _BlogAnalytics1State();
}

class _BlogAnalytics1State extends State<BlogAnalytics1> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width / 3,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text(
                      'View Report',
                      style: TextStyle(
                        fontSize: w * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Text('Blog Analytics',
                        style: TextStyle(
                            fontSize: w * 0.025, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  height: 250,
                  width: 600,
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(),
                      borderData: FlBorderData(show: true),
                      gridData: FlGridData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(1, 10),
                            FlSpot(2, 6),
                            FlSpot(3, 16),
                            FlSpot(4, 12),
                            FlSpot(5, 6),
                            FlSpot(6, 20),
                          ],
                          isCurved: true,
                          colors: [
                            const Color.fromARGB(255, 51, 54, 202),
                          ],
                          barWidth: 2,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: [
                            FlSpot(1, 15),
                            FlSpot(2, 18),
                            FlSpot(3, 7),
                            FlSpot(4, 17),
                            FlSpot(5, 15),
                            FlSpot(6, 16),
                          ],
                          isCurved: true,
                          colors: [
                            const Color.fromARGB(255, 187, 187, 187),
                          ],
                          barWidth: 2,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 52,
            ),
            Container(
              width: 10, // Set desired width
              height: 10, // Set desired height
              decoration: const BoxDecoration(
                color: Colors.blue, // Set desired color
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Last 6 days',
              style: TextStyle(
                fontSize: w * 0.013,
              ),
            ),
            SizedBox(
              width: w * 0.01,
            ),
            Container(
              width: w * 0.02, // Set desired width
              height: w * 0.02, // Set desired height
              decoration: const BoxDecoration(
                color: Colors.grey, // Set desired color
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: w * 0.01,
            ),
            Text(
              'Last Week',
              style: TextStyle(
                fontSize: w * 0.013,
              ),
            )
          ],
        ),
      ],
    );
  }
}
