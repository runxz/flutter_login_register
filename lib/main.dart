import 'package:flutter/material.dart';
import 'session_manager.dart'; // Import the SessionManager
import 'api.dart'; // Import your API-related code
import 'login.dart'; // Import your login screen
import 'dashboard.dart'; // Import your dashboard screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sessionManager = SessionManager();
  final isLoggedIn = await sessionManager.isLoggedIn();

  runApp(isLoggedIn ? DashboardApp() : LoginApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
