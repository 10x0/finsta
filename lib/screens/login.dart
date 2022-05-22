import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(flex: 1, child: Container(color: Colors.transparent)),
          Flexible(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    color: Theme.of(context).textTheme.bodyText2?.color,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration:
                        const InputDecoration(hintText: 'Email or username'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: const ElevatedButton(
                      onPressed: null,
                      child: Text('Log in'),
                    ),
                  )
                ],
              )),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
