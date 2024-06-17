import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship/controller/login_controller.dart';

class Login extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  Login({super.key});

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
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Image.asset(
                      'assets/Logo.png',
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.email_outlined),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Mobile Number",
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 182, 229, 185)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: Obx(() {
                    return TextField(
                      obscureText: _loginController.obscureText.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _loginController.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _loginController.toggleObscureText();
                          },
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 182, 229, 185)),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      bool loginSuccess = false;
                      if (!loginSuccess) {
                        _loginController.showErrorDialog(context, "Error", "Invalid login credentials");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 182, 229, 185),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Log in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 3, 80, 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: Checkbox(
                        value: true,
                        onChanged: (newBool) {},
                      ),
                    ),
                    const Text("Remember me", style: TextStyle(color: Colors.black)),
                    const SizedBox(width: 80),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed('/register');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromARGB(255, 182, 229, 185),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Create New Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 3, 80, 20),
                        ),
                      ),
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
