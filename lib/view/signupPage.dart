import 'package:flutter/material.dart';
import 'package:new_sample_project/controller/AuthProvider.dart';
import 'package:new_sample_project/view/homePage.dart';
import 'package:new_sample_project/view/loginPage.dart';
import 'package:new_sample_project/widgets/textField%20Widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authprovider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            textFieldWidgets("Email", "Enter Email", emailController),
            const SizedBox(height: 20),
            textFieldWidgets("Password", "Enter Password", passwordController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: authProvider.isLoading
                  ? null
                  : () async {
                      await authProvider.signInProviderFunction(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (authProvider.errorMessagge == null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      }
                    },
              child: authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
