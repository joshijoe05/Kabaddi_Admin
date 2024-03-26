import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabadi_admin/components/custom_textform.dart';
import 'package:kabadi_admin/database/common_services.dart';
import 'package:kabadi_admin/database/team_services.dart';

class TeamFormScreen extends StatefulWidget {
  final dynamic doc;
  const TeamFormScreen({super.key, this.doc});

  @override
  State<TeamFormScreen> createState() => _TeamFormScreenState();
}

class _TeamFormScreenState extends State<TeamFormScreen> {
  final TeamController _teamController = Get.put(TeamController());
  var _pickedImage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _nameController.text = widget.doc["name"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams"),
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
                            : NetworkImage(widget.doc["logo"]) as ImageProvider
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
                        controller: _nameController,
                        heading: "Team Name",
                        hintText: "Enter team name",
                        keyboardType: TextInputType.name,
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
                      var url;
                      if (_pickedImage != null) {
                        _teamController.isLoading.value = true;
                        url = await CommonServices().uploadToStorage(
                            _pickedImage, "Teams", widget.doc["id"]);
                      }
                      Map<String, dynamic> data = {
                        "name": _nameController.text,
                        "logo": url ?? widget.doc["logo"],
                        "id": widget.doc["id"]
                      };

                      await _teamController.updateTeam(widget.doc["id"], data);
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
                    child: _teamController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Center(
                            child: Text(
                              "Update Team",
                              style: TextStyle(
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
