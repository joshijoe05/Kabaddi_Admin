import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabadi_admin/components/custom_textform.dart';
import 'package:kabadi_admin/database/article_services.dart';
import 'package:kabadi_admin/database/common_services.dart';

class ArticleFormScreen extends StatefulWidget {
  final dynamic doc;
  const ArticleFormScreen({super.key, this.doc});

  @override
  State<ArticleFormScreen> createState() => _ArticleFormScreenState();
}

class _ArticleFormScreenState extends State<ArticleFormScreen> {
  final ArticleController _articleController = Get.put(ArticleController());
  var _pickedImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final dropDownValues = [
    "Kabaddi Matches",
    "Kabaddi Teams",
    "Kabaddi Players",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _titleController.text = widget.doc["title"];
      _descController.text = widget.doc["description"];
      _articleController.selectedValue.value = widget.doc["topic"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // if (_pickedImage == null)
                  //   const CircleAvatar(
                  //       radius: 64,
                  //       backgroundImage: const NetworkImage(
                  //           'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')
                  //       // AssetImage("images/l1.jpg"),
                  //       ),
                  // if (_pickedImage != null)
                  //   CircleAvatar(
                  //     radius: 64,
                  //     backgroundImage: MemoryImage(_pickedImage),
                  //   ),
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: _pickedImage == null
                        ? (widget.doc == null)
                            ? const NetworkImage(
                                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')
                                as ImageProvider
                            : NetworkImage(widget.doc["imageUrl"])
                                as ImageProvider
                        : MemoryImage(_pickedImage),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () async {
                          await pickImage();
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 500,
                      child: CustomTextFormField(
                        controller: _titleController,
                        heading: "Title",
                        hintText: "Enter title",
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 500,
                      child: CustomTextFormField(
                        controller: _descController,
                        heading: "Description",
                        hintText: "Enter Description",
                        keyboardType: TextInputType.name,
                        maxLength: 500,
                        maxLines: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() {
                      return SizedBox(
                        width: 500,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: _articleController.selectedValue.value,
                          onChanged: (value) {
                            _articleController.selectedValue.value = value!;
                          },
                          borderRadius: BorderRadius.circular(10),
                          items: dropDownValues
                              .map((e) => DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () async {
                    // Creating new page
                    if (_formKey.currentState!.validate()) {
                      if (widget.doc == null) {
                        if (_pickedImage == null) {
                          Get.snackbar("Warning", "Please pick an image");
                          return;
                        }
                        _articleController.isLoading.value = true;
                        final articles = await FirebaseFirestore.instance
                            .collection("Articles")
                            .get();
                        final len = articles.docs.length;
                        String url = await CommonServices().uploadToStorage(
                            _pickedImage, "Articles", "Article $len");
                        Map<String, dynamic> data = {
                          "title": _titleController.text,
                          "description": _descController.text,
                          "imageUrl": url,
                          "id": "Article $len",
                          "topic": _articleController.selectedValue.value
                        };
                        await _articleController.postArticle(data);
                      }
                      // Edit/ Update
                      else {
                        var url;
                        if (_pickedImage != null) {
                          _articleController.isLoading.value = true;
                          url = await CommonServices().uploadToStorage(
                              _pickedImage, "Article", widget.doc["id"]);
                        }
                        Map<String, dynamic> data = {
                          "title": _titleController.text,
                          "description": _descController.text,
                          "imageUrl": url ?? widget.doc["imageUrl"],
                          "topic": widget.doc["title"],
                          "id": widget.doc["id"]
                        };

                        await _articleController.updateArticle(
                            widget.doc["id"], data);
                      }

                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color(0xFFfc5607),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: _articleController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Center(
                            child: Text(
                              widget.doc == null
                                  ? "Post Article"
                                  : "Update Article",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // showSnackbar("Image picked", context);
      _pickedImage = await pickedImage.readAsBytes();
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Please pick an image")));
      Get.snackbar("Warning", "Please pick an image");
    }
  }
}
