import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:applitech/global/variables.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;
  String errorMessage = '';

  Future<void> performLogin() async {
    try {
      final Dio dio = Dio();

      final responsePost = await dio.post(
        'https://intra.epitech.eu/login',
        data: {
          'token': global.token,
          'login': emailController.text,
          'password': passwordController.text,
          'remember_me': 'on',
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      global.redirectUrl = responsePost.data['office_auth_uri'];

      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////

      final login = await dio.get(
        global.redirectUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      // final home = await dio.get(
      //   'https://intra.epitech.eu/?format=json',
      //   options: Options(
      //     headers: {
      //       'Authorization': 'Bearer ${global.token}',
      //     },
      //   ),
      // );

      global.loginUrl = login.data;

      // global.homeData = home.data;

      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////

      Navigator.of(context).pushNamed('/webview');
      print(global.loginUrl);
      print("Login Success");
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Image.asset(
            'assets/epitech_logo.png',
            height: 100,
            width: 100,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(
                      () {
                        // print(value);
                      },
                    );
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    suffixIcon: emailController.text.isEmpty
                        ? const Text('')
                        : GestureDetector(
                            onTap: () {
                              emailController.clear();
                            },
                            child: const Icon(
                              Icons.close,
                            ),
                          ),
                    hintText: 'example@epitech.eu',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  obscureText: isVisible,
                  controller: passwordController,
                  onChanged: (value) {
                    // print(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty &&
                        passwordController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'Please fill all the fields';
                      });
                    } else {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        if (emailController.text.isEmpty) {
                          setState(() {
                            errorMessage = 'Email is missing';
                          });
                        }
                        if (passwordController.text.isEmpty) {
                          setState(() {
                            errorMessage = 'Password is missing';
                          });
                        }
                      } else {
                        errorMessage = '';
                        global.isLoggedIn = true;
                        performLogin();
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text('Submit'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    await performLogin();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.microsoft,
                  ),
                  label: const Text(
                    "Connect with Microsoft",
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
