import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 300,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             SizedBox(
               height: 10,
             ),

              Expanded(
                  child: Text(description,style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),)
              ),

              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    ),
                    onPressed: onEditPressed,
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.pencil
                        ),
                        SizedBox(width: 10,),
                        Text('Edit'),
                      ],
                       ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white),
                    ),
                    onPressed: onDeletePressed,
                    child: Row(
                      children: [
                        Icon(
                            CupertinoIcons.delete,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10,),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
