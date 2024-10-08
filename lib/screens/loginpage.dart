import 'package:bonvoyage/databasehelper/databasehelper.dart';
import 'package:bonvoyage/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Bon_Voyage_Login_BG.gif'),
                  fit: BoxFit.fill,
                  scale: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Form(
            key: formkey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo1.png',
                    height: 300,
                    width: 300,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                        controller: _usernameController,
                        validator: _validateRequired,
                        onChanged: (value) {
                          authProvider.setUsername(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Username',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                        controller: _passwordController,
                        validator: _validateRequired,
                        onChanged: (value) {
                          authProvider.setPassword(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2)))),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          var data = await DataBaseHelper.readOneItemRandom(
                              "Employee",
                              "EmployeeNumber",
                              int.parse(_usernameController.text));
                          authProvider.updateCurrentEmployee(data[0]);
                          print(authProvider.current.toMap());
                          //authProvider.setData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DashBoard(
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                      )));
                        } else {}
                      },
                      child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 165, 0)),
                          ),
                          child: Center(
                            child: Text('Login',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 165, 0))),
                          ))),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
