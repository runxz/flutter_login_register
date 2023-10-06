import 'package:flutter/material.dart';
import 'session_manager.dart'; // Import the SessionManager
import 'api.dart'; // Import your API-related code
import 'login.dart'; // Import your login screen
import 'dashboard.dart'; // Import your dashboard screen

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> _register() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final email = emailController.text;

    final api = Api();
    try {
      final response = await api.register(username, password, email);

      // Handle the response here (e.g., show a success message)

      // Set the session as logged in (for demonstration purposes)
      final sessionManager = SessionManager();
      await sessionManager.setLoggedIn(true);

      // Navigate to the Dashboard (for demonstration purposes)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } catch (e) {
      // Handle registration failure (e.g., show an error message)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Registration failed. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _register,
                child: Text('Register'),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
