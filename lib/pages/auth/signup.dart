import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kachat/services/auth/auth_services.dart';
import 'package:kachat/pages/auth/login.dart';
import 'package:kachat/utility/toast.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/chatShapeBtn.dart';
import '../../widgets/textField.dart';
import '../home/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _signUp(BuildContext context) {
    final auth = AuthServices();
    try {
      setState(() {
        isLoading = true;
      });
      if (_passwordController.text == _confirmPasswordController.text) {
        auth.signUpWithMailPass(_emailController.text, _passwordController.text,
            _userNameController.text).then((value) {
          Utility().toastMessage("Signup Successful");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }).onError((e, stackTrace) {
          Utility().toastMessage(e.toString());
        });

      } else {
        setState(() {
          isLoading = false;
        });
        Utility().toastMessage("Password doest match");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Utility().toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Gap(25),
            //Logo
            Lottie.asset('assets/wechat.json', width: 250, height: 250),
        
            //Welcome message
            Text(
              "Welcome back its time let's KaChat",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const Gap(20),
        
            Form(
              key: _formKey,
              child: Column(
                children: [
                  //Email field
                  MyTextField(
                    hintText: 'Enter Email',
                    isObscured: false,
                    controller: _emailController,
                  ),
                  const Gap(15),
                  //username
                  MyTextField(
                    hintText: 'Enter Username',
                    isObscured: false,
                    controller: _userNameController,
                  ),
                  const Gap(15),
                  //Pw field
                  MyTextField(
                    hintText: 'Enter Password',
                    isObscured: true,
                    controller: _passwordController,
                  ),
                  const Gap(15),
                  //confirm pass
                  MyTextField(
                    hintText: 'Confirm Password',
                    isObscured: true,
                    controller: _confirmPasswordController,
                  ),
                ],
              ),
            ),
            const Gap(35),
            //login btn
            MyChatShapeBtn(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _signUp(context);
                }
              },
              text: "Sign Up", isLoading: isLoading,
            ),
            const Gap(15),
            //register btn
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already registered?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                const Gap(5),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text("Get in!"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
