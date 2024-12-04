import 'package:final_project/services/create_account_controller.dart';
import 'package:final_project/ui/screens/login_screen_ready.dart';
import 'package:final_project/ui/widget/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class CreateAccountScreen extends StatelessWidget {
  final CreateAccountController controller = Get.put(CreateAccountController());

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GetBuilder<CreateAccountController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create your Account",
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
                      controller.email.value = value; // تحديث القيم
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
                        obscureText: !controller.isPasswordVisible
                            .value, // التحكم في إظهار كلمة المرور
                        onChanged: (value) {
                          controller.password.value = value; // تحديث القيم
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordVisible.value
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
                   Obx(() =>  Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
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
                  SizedBox(
                    width: double.infinity,
                    child: SignInButton(
                      text: "Sign up",
                      color: Colors.purple,
                      Textcolor: Colors.white,
                      onPressed: () {
                        controller.createAccount();
                      },
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
                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          //     Get.toNamed("/login_ready_screen");
                          Get.to(LoginScreenReady());
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
