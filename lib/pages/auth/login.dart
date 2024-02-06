
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kachat/services/auth/auth_services.dart';
import 'package:kachat/pages/auth/signup.dart';
import 'package:kachat/pages/home/home_page.dart';
import 'package:kachat/utility/toast.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/chatShapeBtn.dart';
import '../../widgets/textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void _login(BuildContext context) async{
    final authService = AuthServices();

    try{
      setState(() {
        isLoading = true;
      });
      await authService.signInWIthMailPassword(_emailController.text, _passwordController.text).then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomePage()));
      });
    }catch(e){
      Utility().toastMessage(e.toString());
      setState(() {
        isLoading = false;
      });
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
            //const SizedBox(height: 500, width: 500 ,child: RiveAnimation.asset("assets/cyber.riv",)),
            const Gap(50),
            //Logo
            Lottie.asset('assets/wechat.json', width: 250, height: 250),
            const Gap(35),
            //Welcome message
            Text("Connect to loved once? KaChat now",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
            const Gap(20),
            //Email field

            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    hintText: 'Enter Email',
                    isObscured: false,
                    controller: _emailController,
                  ),

                  const Gap(10),
                  //Pw field
                  MyTextField(
                    hintText: 'Enter Password',
                    isObscured: true,
                    controller: _passwordController,
                  )
                ],
              ),
            ),
            const Gap(25),

            //login btn
            MyChatShapeBtn(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _login(context);
                }
              },
              text: "Login", isLoading: isLoading,
            ),

            const Gap(15),
            //register btn
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.secondary)),
                const Gap(5),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                },child: const Text("Register now!"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
