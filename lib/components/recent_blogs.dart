import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kabadi_admin/components/blog_card.dart';
import 'package:kabadi_admin/database/blog_services.dart';
import 'package:kabadi_admin/screens/blog_form.dart';

class RecentBlogs extends StatefulWidget {
  const RecentBlogs({Key? key}) : super(key: key);

  @override
  State<RecentBlogs> createState() => _RecentBlogsState();
}

class _RecentBlogsState extends State<RecentBlogs> {
  final BlogController _blogController = Get.put(BlogController());
  Stream? blogStream;

  getBlogData() async {
    blogStream = await _blogController.getBlogs();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getBlogData();
  }

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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogFormScreen(),
                        ));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      Text("Add New"),
                    ],
                  )),
            ],
          ),
          Obx(() {
            return _blogController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : StreamBuilder(
                    stream: blogStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++)
                                BlogCard(
                                  imageUrl: snapshot.data.docs[i]["imageUrl"],
                                  title: snapshot.data.docs[i]["title"],
                                  description: snapshot.data.docs[i]
                                      ["description"],
                                  onEditPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BlogFormScreen(
                                            doc: snapshot.data.docs[i],
                                          ),
                                        ));
                                  },
                                  onDeletePressed: () async {
                                    await _blogController.deleteBlog(
                                        snapshot.data.docs[i]["id"]);
                                  },
                                ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
          }),
        ],
      ),
    );
  }
}
