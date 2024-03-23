import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';
import 'package:kabadi_admin/components/top_bar.dart';
import 'package:kabadi_admin/responsive/mobilview/components/top_bar.dart';

class AdminDashBoard1 extends StatelessWidget {
  const AdminDashBoard1({super.key});
  static final blueColor = Color.fromARGB(249, 12, 91, 209);
  static final greyColor = Color.fromARGB(255, 172, 168, 173);

  static final List<kabadi> blogRead = [
    kabadi('01', 15, blueColor),
    kabadi('02', 11, blueColor),
    kabadi('03', 13, blueColor),
    kabadi('04', 9, blueColor),
    kabadi('05', 17, blueColor),
    kabadi('06', 19, blueColor),
    kabadi('07', 13, blueColor),
    kabadi('08', 11, blueColor),
    kabadi('09', 12, blueColor),
    kabadi('10', 8, blueColor),
    kabadi('11', 14, blueColor),
    kabadi('12', 16, blueColor),
  ];
  static final List<kabadi> newUser = [
    kabadi('01', 7, greyColor),
    kabadi('02', 13, greyColor),
    kabadi('03', 5, greyColor),
    kabadi('04', 11, greyColor),
    kabadi('05', 8, greyColor),
    kabadi('06', 6, greyColor),
    kabadi('07', 6, greyColor),
    kabadi('08', 13, greyColor),
    kabadi('09', 4, greyColor),
    kabadi('10', 11, greyColor),
    kabadi('11', 9, greyColor),
    kabadi('12', 7, greyColor),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<kabadi, String>> BlogandNewUser = [
      charts.Series(
        id: "Number of People Blog Read",
        data: blogRead,
        domainFn: (kabadi pops, _) => pops.year,
        measureFn: (kabadi pops, _) => pops.value,
        colorFn: (kabadi pops, __) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      ),
      charts.Series(
        id: "Number of New Users",
        data: newUser,
        domainFn: (kabadi pops, _) => pops.year,
        measureFn: (kabadi pops, _) => pops.value,
        colorFn: (kabadi pops, __) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBar1(),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Dashboard",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
          ),
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 3.1),
                    child: TextButton(
                        onPressed: () {}, child: const Text('View Report')),
                  ),

                  //   mai
                  //nAxisAlignment: MainAxisAlignment.,

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: charts.BarChart(
                        BlogandNewUser,
                        animate: true,
                        defaultRenderer: charts.BarRendererConfig(
                          cornerStrategy: const charts.ConstCornerStrategy(0),
                        ),
                        primaryMeasureAxis: const charts.NumericAxisSpec(
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                            desiredTickCount: 7,
                          ),
                        ),
                        /* behaviors: [
                                charts.SeriesLegend(cellPadding: EdgeInsets.all(10))
                              ],*/
                        behaviors: [
                          charts.SeriesLegend(
                            // Positions for "start" and "end" will be left and right respectively
                            // for widgets with a build context that has directionality ltr.
                            // For rtl, "start" and "end" will be right and left respectively.
                            // Since this example has directionality of ltr, the legend is
                            // positioned on the right side of the chart.
                            position: charts.BehaviorPosition.bottom,
                            // For a legend that is positioned on the left or right of the chart,
                            // setting the justification for [endDrawArea] is aligned to the
                            // bottom of the chart draw area.
                            outsideJustification:
                                charts.OutsideJustification.startDrawArea,
                            // By default, if the position of the chart is on the left or right of
                            // the chart, [horizontalFirst] is set to false. This means that the
                            // legend entries will grow as new rows first instead of a new column.
                            horizontalFirst: false,
                            // By setting this value to 2, the legend entries will grow up to two
                            // rows before adding a new column.
                            desiredMaxRows: 2,
                            // This defines the padding around each legend entry.
                            cellPadding:
                                EdgeInsets.only(right: 4.0, bottom: 4.0),
                            // Render the legend entry text with custom styles.
                            entryTextStyle: const charts.TextStyleSpec(
                                color: charts.Color(r: 127, g: 63, b: 191),
                                fontFamily: 'Georgia',
                                fontSize: 11),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class kabadi {
  final String year;
  final int value;
  final Color barColor;

  kabadi(this.year, this.value, this.barColor);
}
