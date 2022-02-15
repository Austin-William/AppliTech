import 'package:flutter/material.dart';
import 'package:applitech/api/api.dart';
import 'package:applitech/global/variables.dart' as global;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController linkController = TextEditingController();
  bool isVisible = true;
  String errorMessage = '';

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
                  obscureText: isVisible,
                  controller: linkController,
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
                    hintText: 'Autologin link',
                    labelText: 'Autologin link',
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
                    if (linkController.text.isEmpty) {
                      setState(() {
                        errorMessage = 'Please fill the field';
                      });
                    } else {
                      if (linkController.text.isEmpty) {
                        if (linkController.text.isEmpty) {
                          setState(() {
                            errorMessage = 'Autologin is required';
                          });
                        }
                      } else {
                        errorMessage = '';
                        global.isLoggedIn = true;
                        global.autologinLink = linkController.text;
                        getData(context);
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text('Submit'),
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
