import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onForgotPasswordTap() {
    // Handle forgot password action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Forgot Password Tapped')),
    );
  }

  void _onCreateAccountTap() {
    // Handle navigation to sign-up screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Create New Account Tapped')),
    );
  }

  void _onLogin() {
    // Handle login action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login Button Pressed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 242, 255), // Set background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo at the top
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // Replace with your logo asset path
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 32),
              // Username field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Password field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 8),
              // Forgot Password link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _onForgotPasswordTap,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Login Button
              ElevatedButton(
                onPressed: _onLogin,
                child: Text('Login'),
              ),
              SizedBox(height: 24),
              // Create New Account link
              GestureDetector(
                onTap: _onCreateAccountTap,
                child: Center(
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
