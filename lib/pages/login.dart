import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
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

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
      global.token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;

      final Dio dio = Dio();

      // dio.post(
      //   'https://login.microsoftonline.com/common/oauth2/token',
      //   data: {
      //     'token': global.token,
      //   },
      // );

      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////

      // final user = await dio.get(
      //   'https://intra.epitech.eu/user/?format=json',
      //   options: Options(
      //     headers: {
      //       'Authorization': 'Bearer ${global.token}',
      //     },
      //   ),
      // );

      // final home = await dio.get(
      //   'https://intra.epitech.eu/?format=json',
      //   options: Options(
      //     headers: {
      //       'Authorization': 'Bearer ${global.token}',
      //     },
      //   ),
      // );

      // global.userData = user.data;
      // global.homeData = home.data;

      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////

      Navigator.of(context).pushNamed('/home');
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
                        Navigator.popAndPushNamed(context, '/home');
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
                    await performLogin("microsoft.com", [
                      "email openid"
                    ], {
                      "prompt": "consent",
                      "tenant": global.tenantId,
                      "token_url": global.urlToken,
                      "redirect_url": global.redirectUrl,
                      "flow_type": "code",
                      "flow": "authorizationCode",
                    });
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
