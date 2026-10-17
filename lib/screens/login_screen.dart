
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _signUp = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.olive),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.sprocket),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.safelightBright),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _signUp ? 'Start your log' : 'Welcome back',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _signUp
                        ? 'A running record of every roll you shoot.'
                        : 'Your rolls are where you left them.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 36),
                  if (_signUp) ...[
                    TextFormField(
                      controller: _nameController,
                      style: const TextStyle(color: AppColors.paper),
                      decoration: _decoration('Name'),
                      validator: (value) {
                        if (_signUp && (value == null || value.trim().isEmpty)) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: AppColors.paper),
                    decoration: _decoration('Email'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                          .hasMatch(value.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: AppColors.paper),
                    decoration: _decoration('Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: Text(_signUp ? 'Create account' : 'Log in'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _signUp = !_signUp;
                        });
                        _formKey.currentState?.reset();
                      },
                      child: Text(
                        _signUp
                            ? 'Already have an account? Log in'
                            : 'New here? Create an account',
                        style: const TextStyle(color: AppColors.olive),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
