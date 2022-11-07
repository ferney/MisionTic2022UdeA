import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("REGISTRATION"),
        elevation: 10,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: nameController,
                        decoration: const InputDecoration(
                            label: Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            hintText: "Pablo Escobar",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: mailController,
                        decoration: const InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            hintText: "abc123@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: dobController,
                        decoration: const InputDecoration(
                            label: Text(
                              "DOB",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            hintText: "DD/MM/YYYY",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: mobileController,
                        decoration: const InputDecoration(
                            label: Text(
                              "Mobile Number",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            hintText: "1234567890",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        controller: passwordController,
                        obscureText: hide,
                        decoration: InputDecoration(
                            label: const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            hintText: "@@#1212**",
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide = !hide;
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye),
                              color: Colors.white,
                            ))),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () async {
                  if (nameController.text != "" &&
                      mailController.text != "" &&
                      dobController.text != "" &&
                      mobileController.text != "" &&
                      passwordController.text != "" &&
                      (mailController.text.contains("@gmail.com") ||
                          mailController.text.contains("@yahoo.com")) &&
                      (passwordController.text.length >= 6)) {
                    try {
                      var login = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: mailController.text,
                              password: passwordController.text);
                      if (login.user != null) {
                        FirebaseFirestore.instance
                            .collection("User")
                            .doc(login.user!.uid)
                            .set({
                          "Name": nameController.text,
                          "Mail": mailController.text,
                          "Dob": dobController.text,
                          "Password": passwordController.text,
                          "Mobile": mobileController.text,
                          "uid": login.user!.uid,
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Registered Successfully",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.white,
                          ),
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please fill all required fields",
                          style: TextStyle(
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
                    minimumSize: const Size(110, 40),
                    maximumSize: const Size(110, 40),
                    backgroundColor: Colors.white70),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
