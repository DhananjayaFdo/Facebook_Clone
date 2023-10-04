import 'package:facebook_clone/layouts/layout_builder.dart';
import 'package:facebook_clone/methods/auth_methods.dart';
import 'package:facebook_clone/utils/App_Dimentions.dart';
import 'package:facebook_clone/utils/app_colors.dart';
import 'package:facebook_clone/utils/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/small_text.dart';
import '../widgets/text_input_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  loginUser() async {
    setState(() {
      isLoading = true;
    });

    String message = await AuthMethods().firebaseLoginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (String != 'success') {
      snackBarMessenger(
        context: context,
        content: message,
      );
    } else {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const CustomLayoutBuilder()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              Flexible(child: Container()),
              SvgPicture.asset(
                "assets/logos/facebook.svg",
                width: 200,
              ),
              SizedBox(height: AppDimentions.height80),

              //username input
              CustomTextField(
                obscureText: false,
                prefixIcon: Icons.person,
                textController: _emailController,
                textInputType: TextInputType.text,
                hintText: "enter username",
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

              //log in button
              InkWell(
                onTap: loginUser,
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
                          text: "log in",
                          fontBold: true,
                        ),
                ),
              ),
              SizedBox(height: AppDimentions.height20),
              Flexible(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSmallText(
                      text: "don't have an account?",
                      textColor: mainColor,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: CustomSmallText(
                        text: "sign up",
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
