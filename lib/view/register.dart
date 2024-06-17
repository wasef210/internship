import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controller/register_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatelessWidget {
  final RegisterController _registerController = Get.put(RegisterController());

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Register({super.key});

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      print('File Name: ${file.name}');
      print('File Size: ${file.size}');
      print('File Path: ${file.path}');
      // Handle file selection
    } else {
      // User canceled the picker
    }
  }

  void _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      print('Photo Path: ${photo.path}');
      // Handle photo selection
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                  child: GestureDetector(
                    onTap: _takePhoto,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 100,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: const TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.email_outlined),
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      hintStyle: const TextStyle(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Obx(() {
                    return TextField(
                      controller: _passwordController,
                      obscureText: _registerController.obscurePassword.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _registerController.obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _registerController.toggleObscurePassword();
                          },
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Obx(() {
                    return TextField(
                      controller: _confirmPasswordController,
                      obscureText: _registerController.obscureConfirmPassword.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _registerController.obscureConfirmPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _registerController.toggleObscureConfirmPassword();
                          },
                        ),
                        hintText: "Confirm Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: ElevatedButton(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 182, 229, 185),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Certificate PDF file",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 3, 80, 20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: _registerController.isLoading.value
                          ? null
                          : () {
                        _registerController.register(
                          _usernameController.text,
                          _emailController.text,
                          _mobileController.text,
                          _passwordController.text,
                          _confirmPasswordController.text,
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 182, 229, 185),
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 3, 80, 20),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login'); 
                  },
                  child: const Text(
                    "Already have an account? Log in",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
