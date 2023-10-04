import 'dart:typed_data';

import 'package:facebook_clone/methods/auth_methods.dart';
import 'package:facebook_clone/screens/login_screen.dart';
import 'package:facebook_clone/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../layouts/layout_builder.dart';
import '../utils/App_Dimentions.dart';
import '../utils/app_colors.dart';
import '../utils/snakbar.dart';
import '../widgets/small_text.dart';
import '../widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPassController = TextEditingController();

  bool isLoading = false;
  Uint8List? _uint8list;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conPassController.dispose();
  }

  imageSelect() async {
    var image = await customImagePicker(ImageSource.gallery, context);
    setState(() {
      if (image != null) {
        _uint8list = image;
      } else {
        snackBarMessenger(context: context, content: "no image selected");
      }
    });
  }

  userSignup() async {
    print("object");

    setState(() {
      isLoading = true;
    });
    String _output = await AuthMethods().userInputDataGet(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      conPassword: _conPassController.text,
      image: _uint8list!,
    );
    setState(() {
      isLoading = false;
    });

    if (_output == 'user profile created') {
      snackBarMessenger(
        context: context,
        content: _output,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomLayoutBuilder(),
        ),
      );
    } else {
      snackBarMessenger(
        context: context,
        content: _output,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppDimentions.height110),
              SvgPicture.asset(
                "assets/logos/facebook.svg",
                width: 200,
              ),
              SizedBox(
                height: AppDimentions.height20,
              ),

              //profile image
              Stack(
                children: [
                  _uint8list != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(_uint8list!),
                          radius: 70,
                        )
                      : const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.aquaknect.com.au/wp-content/uploads/2019/11/person_outline.jpg"),
                          radius: 70,
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: imageSelect,
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimentions.height20,
              ),

              //username input
              CustomTextField(
                obscureText: false,
                prefixIcon: Icons.person,
                textController: _usernameController,
                textInputType: TextInputType.text,
                hintText: "enter username",
              ),
              SizedBox(height: AppDimentions.height20),

              //email input
              CustomTextField(
                obscureText: false,
                prefixIcon: Icons.email,
                textController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: "enter email",
              ),
              SizedBox(height: AppDimentions.height20),

              //password  input
              CustomTextField(
                prefixIcon: Icons.password,
                obscureText: true,
                isPassword: true,
                textController: _passwordController,
                textInputType: TextInputType.visiblePassword,
                hintText: "enter Password",
              ),
              SizedBox(height: AppDimentions.height20),

              //confirm   input
              CustomTextField(
                prefixIcon: Icons.password,
                obscureText: true,
                textController: _conPassController,
                textInputType: TextInputType.visiblePassword,
                hintText: "confirm Password",
              ),
              SizedBox(height: AppDimentions.height20),

              //signup button
              InkWell(
                onTap: userSignup,
                child: Container(
                  height: 50,
                  width: AppDimentions.width300,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : CustomSmallText(
                          text: "sign up",
                          fontBold: true,
                        ),
                ),
              ),
              SizedBox(height: AppDimentions.height20),

              //bottum login navigartor
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSmallText(
                      text: "already have an account?",
                      textColor: mainColor,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LoginScreen()),
                          ),
                        );
                      },
                      child: CustomSmallText(
                        text: "log in",
                        textColor: mainColor,
                        fontBold: true,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
