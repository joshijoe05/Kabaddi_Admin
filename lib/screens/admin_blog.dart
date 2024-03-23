import "package:flutter/material.dart";
import "package:kabadi_admin/components/blog_analytics.dart";
import "package:kabadi_admin/components/recent_blogs.dart";
import "package:kabadi_admin/components/top_bar.dart";
import "package:kabadi_admin/components/visitors.dart";

class AdminBlogs extends StatelessWidget {
  const AdminBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            searchBar(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                BlogAnalytics(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.015),
                  child: Container(
                    width: 1, // width of the line
                    height: 300, // height of the line
                    color: Colors.grey, // color of the line
                  ),
                ),
                Visitors(),
              ],
            ),
            Divider(
                //height: 50,
                ),
            RecentBlogs(),
          ],
        ),
      ),
    );
  }
}
