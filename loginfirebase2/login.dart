import 'package:firebase_auth/firebase_auth.dart';
import 'join_or_login.dart';
import 'login_background.dart';
import 'forget_pw.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: size,
            painter: LoginBackground(
                isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authBUtton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Consumer<JoinOrLogin>(
                builder: (context, joinOrLogin, child) => GestureDetector(
                  onTap: () {
                    joinOrLogin.toggle();
                  },
                  child: Text(
                      joinOrLogin.isJoin
                          ? "Already have an Account? Join in"
                          : "Don't have an Account? Create One",
                      style: TextStyle(
                        color: joinOrLogin.isJoin ? Colors.red : Colors.blue,
                      )),
                ),
              ),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }

  void _login(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final User? user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text('Please try again later.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }

  Widget _authBUtton(Size size) => Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => ElevatedButton(
                child: Text(joinOrLogin.isJoin ? "Join" : "Login"),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        joinOrLogin.isJoin ? Colors.red : Colors.blue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    joinOrLogin.isJoin ? _register(context) : _login(context);
                  }
                }),
          )));

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Pease input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Pease input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Consumer<JoinOrLogin>(
                      builder: (context, value, child) => Opacity(
                          opacity: value.isJoin ? 0 : 1,
                          child: GestureDetector(
                              onTap: value.isJoin
                                  ? null
                                  : () {
                                      goToForgetPw(context);
                                    },
                              child: Text('Forget Password')))),
                ],
              )),
        ),
      ),
    );
  }

  goToForgetPw(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgetPw()));
  }
}
