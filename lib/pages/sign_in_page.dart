import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/users_controller.dart';
import '../models/error_response.dart';
import '../providers/user_provider.dart';
import '../utils/alerts.dart';
import '../utils/utils.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/page_loader.dart';
import '../widgets/scaffold_wrapper.dart';
import '../widgets/v_spacing.dart';
import 'home_page.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool loading = false;
  final usersController = UsersController();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Walkie Talkie'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VSpacing(20),
                SizedBox(
                  width: mqWidth(context, 60),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      label: Text("Email")
                    ),
                    onChanged: (newValue){
                      email = newValue;
                    },
                  ),
                ),
                const VSpacing(5),
                SizedBox(
                  width: mqWidth(context, 60),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Contraseña',
                      label: Text("Contraseña"),
                    ),
                    onChanged: (newValue){
                      password = newValue;
                    },
                  ),
                ),
                const VSpacing(3),
                CustomButton(
                  width: 60,
                  label: "Continuar", 
                  onPressed: () async {
                    if(loading) return;
                    setState(() {
                      loading = true;
                    });
                    final authResp = await usersController.signInUserEmailPassword(email, password);
                    if(authResp is ErrorResponse){
                      setState(() {
                        loading = false;
                      });
                      showError(context: context, title: "Error", subtitle: authResp.message);
                      return;
                    }
                    final temp = authResp as User;
                    final resp = await usersController.fetchUserById(temp.uid);
                    if(resp is ErrorResponse){
                      setState(() {
                        loading = false;
                      });
                      showError(context: context, title: "Error", subtitle: resp.message);
                      return;
                    }
                    Provider.of<UserProvider>(context, listen: false).setNewUser(resp);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
                  }
                )
              ],
            )
          ),
          PageLoader(
            loading: loading, 
            message: "Iniciando sesión"
          )
        ],
      )
    );
  }
}