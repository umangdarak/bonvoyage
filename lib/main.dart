import 'package:bonvoyage/forms/carbooking.dart';
import 'package:bonvoyage/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(), child: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const LoginPage(),
        'car': (ctx) => const CarBooking(),
      },
    );
  }
}

class AuthProvider extends ChangeNotifier {
  String _username = '';
  String _password = '';
  String get username => _username;
  String get password => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
