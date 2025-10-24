
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_sample_project/model/StudentModel.dart';

class Serviceclass {
  final _firestore =FirebaseFirestore.instance;
  final String _collection ="sampleProject";

  Stream <List<Studentmodel>> getStudent(){
    try {
      return _firestore.collection(_collection).snapshots().map(
      (snapShot)=>snapShot.docs.map(
        (doc)=>Studentmodel.fromMap(doc.data(), doc.id)
        ).toList()
      );
      
    }on Exception catch (e) {
      log("Error:$e");
      rethrow;
    } catch(e){ 
      log("Error:$e");
      rethrow;
    }
    
  }

  Future <void>addStudent(Studentmodel student)async{
    try {
      await _firestore.collection(_collection).add(student.toMap());
      log("Successfully Add Student");
    }on Exception catch (e) {
      log("Error1:$e");
      rethrow;
    }catch(e){
      log("Error:$e");
      throw Exception("failed");
    }
  }

  Future<void> updateStudent(String id,Studentmodel student)async{
    try {
      await _firestore.collection(_collection).doc(id).update(student.toMap());
      log("Successfully Add Student");
    }on Exception catch (e) {
      log("Error1:$e");
      rethrow;
    }catch(e){
      log("Error:$e");
      rethrow;
    }
  }

  Future <void> deleteStudent(String id)async{
    try {
      await _firestore.collection(_collection).doc(id).delete();
    }on Exception catch (e) {
      log("Error1:$e");
      rethrow;
    }catch(e){
      log("Error:$e");
      rethrow;
    }
  }
}