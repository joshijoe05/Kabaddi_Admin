import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabadi_admin/components/custom_textform.dart';
import 'package:kabadi_admin/database/blog_services.dart';
import 'package:kabadi_admin/database/common_services.dart';
import 'package:kabadi_admin/database/player_services.dart';

class PlayerFormScreen extends StatefulWidget {
  final dynamic doc;
  final List<Map<String, String>> teamList;
  const PlayerFormScreen({super.key, this.doc, required this.teamList});

  @override
  State<PlayerFormScreen> createState() => _PlayerFormScreenState();
}

class _PlayerFormScreenState extends State<PlayerFormScreen> {
  final PlayerController _playerController = Get.put(PlayerController());
  var _pickedImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _matchesController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _jerseyController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _nameController.text = widget.doc["name"];
      _ageController.text = widget.doc["age"].toString();
      _pointsController.text = widget.doc["points"].toString();
      _matchesController.text = widget.doc["matchesPlayed"].toString();
      _jerseyController.text = widget.doc["jerseyNo"].toString();
      _aboutController.text = widget.doc["about"];
      _positionController.text = widget.doc["position"];
      _teamController.text = widget.doc["teamName"];
      widget.teamList
          .removeWhere((element) => element["name"] == "All Players");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 300,
                            child: CustomTextFormField(
                              controller: _nameController,
                              heading: "Player Name",
                              hintText: "Enter name",
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: DropdownMenu(
                              onSelected: (value) {
                                _teamController.text = value!;
                              },
                              initialSelection: _teamController.text,
                              width: 300,
                              dropdownMenuEntries: widget.teamList.map((e) {
                                return DropdownMenuEntry(
                                    value: e['name'], label: e['name']!);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 300,
                            child: CustomTextFormField(
                              controller: _ageController,
                              heading: "Player Age",
                              hintText: "Enter age",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextFormField(
                              controller: _jerseyController,
                              heading: "Player Jersey No.",
                              hintText: "Enter jersey no",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 300,
                            child: CustomTextFormField(
                              controller: _pointsController,
                              heading: "Points Scored",
                              hintText: "Enter points",
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: CustomTextFormField(
                              controller: _positionController,
                              heading: "Player Position",
                              hintText: "Enter position",
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomTextFormField(
                          controller: _matchesController,
                          heading: "Matches Played",
                          hintText: "Enter matches",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                          controller: _aboutController,
                          heading: "About Player",
                          hintText: "Player description",
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
                      if (_formKey.currentState!.validate()) {
                        var url;
                        int age, jerseyNo, matches, points;
                        try {
                          age = int.parse(_ageController.text);
                          jerseyNo = int.parse(_jerseyController.text);
                          matches = int.parse(_matchesController.text);
                          points = int.parse(_pointsController.text);
                        } catch (e) {
                          Get.snackbar("Error", "please enter a number");
                          return;
                        }
                        if (_pickedImage != null) {
                          _playerController.isLoading.value = true;
                          url = await CommonServices().uploadToStorage(
                              _pickedImage, "Players", widget.doc["id"]);
                        }

                        Map<String, dynamic> data = {
                          "about": _aboutController.text,
                          "name": _nameController.text,
                          "imageUrl": url ?? widget.doc["imageUrl"],
                          "age": age,
                          "jerseyNo": jerseyNo,
                          "points": points,
                          "position": _positionController.text,
                          "teamName": _teamController.text,
                          "matchesPlayed": matches,
                        };

                        await _playerController.updatePlayer(
                            widget.doc["id"], data);
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color(0xFFfc5607),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: _playerController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Center(
                              child: Text(
                                widget.doc == null
                                    ? "Post Player"
                                    : "Update Player",
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
