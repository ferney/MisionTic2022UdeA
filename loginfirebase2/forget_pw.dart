import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  const ForgetPw({Key? key}) : super(key: key);

  @override
  State<ForgetPw> createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email *',
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Pease input correct Email.";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailController.text);
                  final snacBar = SnackBar(
                    content: Text('Check your email.'),
                  );
                  ScaffoldMessenger.of(_formKey.currentContext!)
                      .showSnackBar(snacBar);
                },
                child: Text('Reset Password')),
          ],
        ),
      ),
    );
  }
}
