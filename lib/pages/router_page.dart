import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkie_taklie_app/pages/sign_in_page.dart';

import '../controllers/users_controller.dart';
import '../models/error_response.dart';
import '../providers/user_provider.dart';
import 'home_page.dart';


class RouterPage extends StatefulWidget {
  const RouterPage({Key? key}) : super(key: key);

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {

  final usersController = UsersController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSession();
    });
  }

  Future<void> loadSession() async {
    final authResp = await usersController.recoverSession();
    if(authResp is ErrorResponse){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
      return;
    }
    final temp = authResp as User;
    final resp = await usersController.fetchUserById(temp.uid);
    if(resp is ErrorResponse){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInPage()), (route) => false);
      return;
    }
    Provider.of<UserProvider>(context, listen: false).setNewUser(resp);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}