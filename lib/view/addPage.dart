import 'package:flutter/material.dart';
import 'package:new_sample_project/widgets/textField%20Widget.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final nameController=TextEditingController();
  final ageController=TextEditingController();
  final addressController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
          children: [
            textFieldWidgets("Enter a Name", "Name", nameController),
            SizedBox(height: 20),
            textFieldWidgets("Enter a age", "age", ageController),
            SizedBox(height: 20),
            textFieldWidgets("Enter a address", "address", addressController),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Student added successfully!")),
                  );
                  Navigator.pop(context); 
                }
              },
              child: const Text("Save"),
            ),]),
    );
  }
}