import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabadi_admin/components/custom_textform.dart';
import 'package:kabadi_admin/database/blog_services.dart';
import 'package:kabadi_admin/database/common_services.dart';

class BlogFormScreen extends StatefulWidget {
  final dynamic doc;
  const BlogFormScreen({super.key, this.doc});

  @override
  State<BlogFormScreen> createState() => _BlogFormScreenState();
}

class _BlogFormScreenState extends State<BlogFormScreen> {
  final BlogController _blogController = Get.put(BlogController());
  var _pickedImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _titleController.text = widget.doc["title"];
      _descController.text = widget.doc["description"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs"),
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
                        _blogController.isLoading.value = true;
                        final blogs = await FirebaseFirestore.instance
                            .collection("Blogs")
                            .get();
                        final len = blogs.docs.length;
                        String url = await CommonServices().uploadToStorage(
                            _pickedImage, "Blogs", "Blog $len");
                        Map<String, dynamic> data = {
                          "title": _titleController.text,
                          "description": _descController.text,
                          "imageUrl": url,
                          "id": "Blog $len",
                        };
                        await _blogController.postBlog(data);
                      }
                      // Edit/ Update
                      else {
                        var url;
                        if (_pickedImage != null) {
                          url = await CommonServices().uploadToStorage(
                              _pickedImage, "Blogs", widget.doc["id"]);
                        }
                        Map<String, dynamic> data = {
                          "title": _titleController.text,
                          "description": _descController.text,
                          "imageUrl": url ?? widget.doc["imageUrl"],
                          "id": widget.doc["id"]
                        };

                        await _blogController.updateBlog(
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
                    child: _blogController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Center(
                            child: Text(
                              widget.doc == null ? "Post Blog" : "Update Blog",
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
