import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uietconnect/files/login/widgets/custom_scaffold.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController forgotpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 250.0,left: 10,right: 10),
        child: ListTile(
          title: SizedBox(
            height: 250,
            width: double.maxFinite,
            child: Column(
              children: [
                // forgotpassword
                TextFormField(
                  controller: forgotpassword,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12, // Default border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (forgotpassword.text.isNotEmpty) {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: forgotpassword.text).whenComplete(() => Navigator().onPopPage);
                      }
                    },
                    child: const Text('Sign in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
}
