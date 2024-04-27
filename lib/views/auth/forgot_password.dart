import 'package:cogniversity/widgets/global/spacer.dart';
import 'package:cogniversity/widgets/textfield.dart';
import 'package:flutter/material.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  // bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              MyTextField(
                  controller: _emailController,
                  label: "Email address",
                  hinttext: "Enter your Email address",
                  keyboardtype: TextInputType.emailAddress,
                  enabled: true),
              const MySpacer(height: 10,),
              // _isLoading
              // ? ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       minimumSize: const Size(double.infinity, 50),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12),
              //           side: BorderSide.none),
              //       backgroundColor: Colors.deepPurple,
              //     ),
              // child: const CircularProgressIndicator(
              //   color: Colors.white,
              // ),
              // )
              // :
              ElevatedButton(
                onPressed: () {
                  // AuthService().forgotPassword(_emailController.text);
                  // try {} catch (e) {}
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text("Password Reset"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

