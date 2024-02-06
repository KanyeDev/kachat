import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../services/auth/auth_services.dart';
import '../pages/auth/login.dart';
import '../pages/setting/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context){
    final authService  = AuthServices();
    authService.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(children: [
            DrawerHeader(
              child: Center(
                child: Lottie.asset('assets/wechat.json', width: 150, height: 150),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("H O M E"),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text("S E T T I N G S"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsPage()));
                },
              ),
            ),
          ],),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 30),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: () {
                logout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
