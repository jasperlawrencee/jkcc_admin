import 'package:flutter/material.dart';
import 'package:jkcc_admin/components/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade200,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: 600,
            padding: EdgeInsets.all(defaultPadding),
            margin: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(4, 8),
                  spreadRadius: 0.2,
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'JKCC Admin',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: defaultPadding),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      // Registration Form
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding),
                                  TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding),
                                  TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Register'),
                            ),
                            TextButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Text('Already have an account? Login'),
                            ),
                          ],
                        ),
                      ),
                      // Login Form
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: defaultPadding),
                                  TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Login'),
                            ),
                            TextButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Text("Don't have an account? Register"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
