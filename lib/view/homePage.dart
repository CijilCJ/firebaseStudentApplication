import 'package:flutter/material.dart';
import 'package:new_sample_project/auth/Auth.dart';
import 'package:new_sample_project/controller/providerController.dart';
import 'package:new_sample_project/model/StudentModel.dart';
import 'package:new_sample_project/view/addPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Providercontroller>(context, listen: false);
    final auth=Auth();

    return Scaffold(
      appBar: AppBar(title: const Text("Student List"),leading: IconButton(onPressed: ()=>auth.SignOut(), icon: Icon(Icons.logout)),),
      body: StreamBuilder<List<Studentmodel>>(
        stream: provider.getStudentStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final students = snapshot.data ?? [];

          if (students.isEmpty) {
            return const Center(child: Text("No students added yet"));
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (_, index) {
              final student = students[index];
              return ListTile(
                title: Text(student.Name),
                subtitle:
                    Text("Age: ${student.Age}, Address: ${student.Address}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => provider.deleteStudent(student.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Addpage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
