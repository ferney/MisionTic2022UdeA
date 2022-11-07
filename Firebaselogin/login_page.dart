import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginmailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("LOGIN"),
        backgroundColor: Colors.deepPurple,
        elevation: 10,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: loginmailController,
                    decoration: InputDecoration(
                        label: const Text("Email",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                        hintText: "abc@gmail.com",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail),
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: loginpasswordController,
                    obscureText: hide,
                    decoration: InputDecoration(
                        label: const Text("Password",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        hintText: "@@#2121**",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hide = !hide;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  var login = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: loginmailController.text,
                          password: loginpasswordController.text);
                  if (login.user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomePage()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Login Successfully",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.white,
                      ),
                      // ignore: use_build_context_synchronously
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        e.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      duration: Duration(seconds: 3),
                      backgroundColor: Colors.white,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: const Size(110, 40),
                  minimumSize: const Size(110, 40),
                  backgroundColor: Colors.grey),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
