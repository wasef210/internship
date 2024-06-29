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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    controller: _loginController.emailController,
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                  child: TextField(
                    controller: _loginController.mobileController,
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
                      controller: _loginController.passwordController,
                      obscureText: _loginController.obscureText.value,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _loginController.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _loginController.toggleObscureText,
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
                  child:
                  ElevatedButton(
                    onPressed: _loginController.isLoading.value
                        ? null
                        : () {
                      _loginController.login();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor:
                      const Color.fromARGB(255, 182, 229, 185),
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
                      child: Obx(() {
                        return Checkbox(
                          value: _loginController.rememberMe.value,
                          onChanged: (newBool) {
                            _loginController.rememberMe.value = newBool!;
                          },
                        );
                      }),
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.black),
                      ),
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
                        "Create new account",
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
