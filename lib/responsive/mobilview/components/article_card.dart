import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleCard1 extends StatefulWidget {
  final String imageUrl =
      'https://imgs.search.brave.com/jEy_cZ4ZMRKEz_sZLIdH16EZoy6LqeDUughTtr0OyM8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNTIx/NzQyNTYwL3Bob3Rv/L21lbi1wbGF5aW5n/LWthYmJhZGktaW4t/dmlsbGFnZS1yYWph/c3RoYW4taW5kaWEu/anBnP3M9NjEyeDYx/MiZ3PTAmaz0yMCZj/PVZXNkVldGEySHVn/SEdfZFRTSG9aWWZS/MjV5Skp3R3BYNWxL/MUZjZnpPNlE9';
  final String title;
  final String description;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const ArticleCard1({
    Key? key,
    // required this.imageUrl,
    required this.title,
    required this.description,
    required this.onEditPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  _ArticleCard1State createState() => _ArticleCard1State();
}

class _ArticleCard1State extends State<ArticleCard1> {
  Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cardColor = cardColor == Colors.deepOrangeAccent
              ? Colors.white
              : Colors.deepOrangeAccent;
        });
      },
      child: Column(
        children: [
          Container(
            height: 500,
            width: 280,
            child: Card(
              color: cardColor,
              elevation: 3,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Center(
                        child: Image.network(
                          widget.imageUrl,
                          width: 230,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            8), // Added SizedBox to add space between image and title
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: cardColor == Colors.deepOrangeAccent
                            ? Colors.white
                            : Colors
                                .black, // Change text color based on cardColor
                      ),
                    ),
                    SizedBox(
                        height:
                            8), // Added SizedBox to add space between title and description
                    Expanded(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: cardColor == Colors.deepOrangeAccent
                              ? Colors.white60
                              : Colors
                                  .black54, // Change text color based on cardColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                ),
                onPressed: widget.onEditPressed,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.pencil),
                    SizedBox(width: 10),
                    Text('Edit'),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                ),
                onPressed: widget.onDeletePressed,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
