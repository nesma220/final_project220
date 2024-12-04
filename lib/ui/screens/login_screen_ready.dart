import 'package:final_project/services/login_controller.dart';
import 'package:final_project/ui/screens/create_account_screen.dart';
import 'package:final_project/ui/widget/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreenReady extends StatelessWidget {
  LoginScreenReady({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow icon
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 20),
              // Title
              const Text(
                "Login to your Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Email TextField
              TextField(
                onChanged: (value) {
                  controller.emaillogin.value = value; // تحديث القيم
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              Obx(() => TextField(
                    obscureText: !controller.isPasswordVisiblelogin
                        .value, // التحكم في إظهار كلمة المرور
                    onChanged: (value) {
                      controller.passwordlogin.value = value; // تحديث القيم
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordVisiblelogin.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: controller
                            .togglePasswordVisibility, // تعديل لرؤية كلمة المرور
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  )),
              const SizedBox(height: 20),
              // Remember me checkbox
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMelogin.value,
                        onChanged: (value) {
                          controller.toggleRememberMe(value);
                        },
                        activeColor: Colors.purple,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              // Sign up button
              // SizedBox(
              //   width: double.infinity,
              //   child: SignInButton(
              //     text: "Sign up",
              //     color: Colors.purple,
              //     Textcolor: Colors.white,
              //     onPressed: () {

              //     },
              //   ),
              // ),
              const SizedBox(height: 20),
              // "Or continue with" section
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),
              // Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFF7210FF),
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.loginAccount();
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Forgot password
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot the password?",
                    style: TextStyle(
                      color: Color(0xFF7210FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // "Or continue with" section
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or continue with"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 20),
              // Social media buttons
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialMediaButton(icon: Icons.facebook),
                  SocialMediaButton(icon: Icons.source_rounded),
                  SocialMediaButton(icon: Icons.apple),
                ],
              ),
              const SizedBox(height: 20),
              // Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: TextButton(
                      onPressed: () => Get.to(CreateAccountScreen()),
                      child:const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color(0xFF7210FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
