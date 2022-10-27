import 'package:flutter/material.dart';
import 'package:jumbo_electronics/pages/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  formprocess(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      changebutton = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 600));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      changebutton = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.contain,
                ),
                Text(
                  "Welcome $username",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Username",
                            hintText: "Please enter your username"),
                        onChanged: (value) {
                          username = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Please enter your password"),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be more than 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () => formprocess(context),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          height: 40,
                          width: changebutton ? 45 : 120,
                          alignment: Alignment.center,
                          // color: Colors.deepPurple,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape: changebutton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changebutton ? 40 : 7),
                          ),
                          child: changebutton
                              ? const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
