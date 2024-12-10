import 'package:flutter/material.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/image_res.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var screenHeight = media.height;
    var screenWidth = media.width;

    return Scaffold(
      body: Row(
        children: [
          // Left Panel - Sign In Form
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Row(
                    children: [
                      Image.asset(ImageRes.letterW,height: screenHeight*0.085,),
                      const Text(
                        "ireSense",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2074f2),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                      ),
                    ),

                    const SizedBox(height: 10),
                    // Don't have an account
                    Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFF718096),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            // Create account logic here
                          },
                          child: const Text(
                            "Create now",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xFF1C4532),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Employee Id",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ),
                    // Email Input
                    Container(
                      width: screenWidth*0.3,
                      alignment: Alignment.center,
                      child: TextFormField(
                        onChanged: (value) => {},
                        keyboardType: TextInputType.number,
                        controller: employeeIdController,
                        //validator: (value) => validator!(value!),
                        // autovalidateMode: ,
                        // this is for decorating the text field
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            hintText: 'Enter your employee id',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black,width: 1.0),
                                borderRadius: BorderRadius.circular(10)),

                            ///this is the default border active when not focused
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFCBD5E0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFFCBD5E0),
                              ),
                            ),
                            ///this will be used when a text field in disabled
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                    width: 0.0
                                ),
                                borderRadius: BorderRadius.circular(10))),
                        maxLines: 1,
                        autocorrect: false,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(height: 20),
                      const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ),
                      Container(
                      width: screenWidth*0.3,
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter",
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFFCBD5E0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xFFCBD5E0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              side: const BorderSide(
                                color: Color(0xFFCFD9E0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5.0), // Set the desired border radius
                              ),
                              value: _isChecked, // Current checkbox state
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!; // Update checkbox state
                                });
                              },
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF718096),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenWidth*0.1,),
                        TextButton(
                          onPressed: () {
                            // Forgot password logic
                          },
                          child: const Text("Forgot Password?",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF1C4532),
                              decoration: TextDecoration.underline,
                            ),),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.08),
                    SizedBox(
                        width: screenWidth*0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // Sign in logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4318ff),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xFFF7FAFC),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],),
                )
              ],
            ),
          ),

          // Right Panel - Introduction
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF4318FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageRes.wireSenseElectro,
                    width: media.width * 0.3,
                    height: media.height * 0.4,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Introducing new Platform!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Color(0xFFF7FAFC),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "There are many variations of passages of Lorem Ipsum available.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFCFD9E0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}