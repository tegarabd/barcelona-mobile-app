import 'package:barcelona/views/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  void onPressedLogin(BuildContext context) {
    if (ctrlUsername.text == "" || ctrlPassword.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username and Password must not be Empty')));
    } else if (!ctrlUsername.text.startsWith("Cules")) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username must be starts with "Cules"')));
    } else if (ctrlUsername.text.length < 7) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username must be 7 characters or more')));
    } else if (ctrlPassword.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password must be 8 characters or more')));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomePage(
            username: ctrlUsername.text,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          alignment: const Alignment(20, -1),
          "assets/svg/zigzag_background.svg",
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/img/logo.png",
                  width: 80,
                  height: 80,
                ),
              ),
              const Text(
                'Log Into My Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 187, 0)),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: ctrlUsername,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Username',
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  controller: ctrlPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 18)),
                    child: const Text('LOG IN'),
                    onPressed: () => onPressedLogin(context),
                  )),
            ],
          ),
        ),
      ],
    ));
  }
}
