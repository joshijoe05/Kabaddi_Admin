import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Forms extends StatefulWidget {
  const Forms({Key? key, required void Function(String title, String description, Uint8List? image) onSubmit});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  Uint8List? _image;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _imageFile = await _imagePicker.pickImage(source: source);
    if (_imageFile != null) {
      final bytes = await _imageFile.readAsBytes();
      setState(() {
        _image = bytes;
      });
    } else {
      print("Image not selected");
    }
  }

  Future<String?> uploadImage(Uint8List? imageBytes) async {
  if (imageBytes == null) return null; // Handle no image case

  try {
    final storage = FirebaseStorage.instance;
    final ref = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final uploadTask = ref.putData(imageBytes);

    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

Future<void> saveDataToFirestore(String title, String description, String? imageUrl) async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('posts');

  final data = {
    'title': title,
    'description': description,
    'imageUrl': imageUrl,
    'createdAt': DateTime.now(), // Optional timestamp for sorting/filtering
  };

  await collectionRef.add(data); // Or use .doc() for a specific document ID
}


  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content Here"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image != null
                ? Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: MemoryImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () => pickImage(ImageSource.gallery),
                    child: Container(
                      width: 150,
                      height: 120,
                      color: Colors.grey[200],
                      child: Icon(Icons.add_a_photo),
                    ),
                  ),
            SizedBox(height: 30),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _descriptionController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _onsubmit();
              },
              child: Text("Post Blog"),
            ),
          ],
        ),
      ),
    );
  }
  void _onsubmit()async{
  String title = _titleController.text.trim();
  String description = _descriptionController.text.trim();

  String? imageUrl = await uploadImage(_image); // Upload image if selected

  await saveDataToFirestore(title, description, imageUrl);

}
}


