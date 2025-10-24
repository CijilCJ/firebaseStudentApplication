import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_sample_project/controller/AuthProvider.dart';
import 'package:new_sample_project/view/signupPage.dart';
import 'package:new_sample_project/widgets/textField%20Widget.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passWordController =TextEditingController();

 bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LoginPage"),
              Gap(20),
              textFieldWidgets("Enter a email", "Email",_emailController),
              Gap(20),
              textFieldWidgets("Password", "PassWord", _passWordController),
              Gap(20),
              ElevatedButton(
              onPressed: authProvider.isLoading
                  ? null
                  : () async {
                      await authProvider.signInProviderFunction(
                        _emailController.text.trim(),
                        _passWordController.text.trim(),
                      );
                    },
              child: authProvider.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Login"),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignUpPage()),
              ),
              child: const Text("Don't have an account? Sign Up"),
            ),
            ],
          ),
        ),
      ),
    );
  }
}