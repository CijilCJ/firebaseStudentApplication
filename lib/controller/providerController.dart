import 'package:flutter/material.dart';
import 'package:new_sample_project/model/StudentModel.dart';
import 'package:new_sample_project/service/serviceClass.dart';


class Providercontroller extends ChangeNotifier {
  
  final Serviceclass _serviceclass =Serviceclass();

  List <Studentmodel> _studentList=[];
  List<Studentmodel> get getStudentList =>_studentList;
  String? ErrorMessagge;
  bool isLoading=false;

Stream<List<Studentmodel>> getStudentStream() {
    return _serviceclass.getStudent();
  }
 

  Future<void> addFunction(Studentmodel student)async{
    isLoading=true;
    notifyListeners();
    try {
      await  _serviceclass.addStudent(student);
    } catch (e) {
      ErrorMessagge="Error:$e";
    } finally{
      isLoading=false;
    notifyListeners();
    }
  }
  List<Studentmodel> getFunction(studentList){
    isLoading =true;
    notifyListeners();
    try {
     _serviceclass.getStudent();
    _studentList= studentList;
    notifyListeners();
    } catch (e) {
      ErrorMessagge="Error:$e";
    }finally{
      isLoading=false;
      notifyListeners();
    }
    return studentList;
  }

  Future<void> updateStudent(Studentmodel student, String id)async{
    isLoading = true;
    notifyListeners();
    try {
      await _serviceclass.updateStudent(id, student);
      notifyListeners();
    } catch (e) {
      ErrorMessagge="Error:$e";
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

  Future<void>deleteStudent(String id)async{
    try {
      await _serviceclass.deleteStudent(id);
      notifyListeners();
    } catch (e) {
      ErrorMessagge="Error:$e";
    }finally{
      isLoading=false;
      notifyListeners();
    }
  }

}