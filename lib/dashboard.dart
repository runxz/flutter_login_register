import 'package:flutter/material.dart';
import 'session_manager.dart'; // Import the SessionManager
import 'login.dart'; // Import your login screen

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _logout() async {
    // Clear the session by marking the user as not logged in
    final sessionManager = SessionManager();
    await sessionManager.setLoggedIn(false);

    // Navigate back to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          // Add a Logout button in the app bar
          TextButton(
            onPressed: _logout,
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
