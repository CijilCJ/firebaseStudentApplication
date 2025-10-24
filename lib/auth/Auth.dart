import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_sample_project/model/studentdata.dart';

class Auth{
 
 final FirebaseAuth _auth=FirebaseAuth.instance;
 final FirebaseFirestore _firestore=FirebaseFirestore.instance;
 final String _collection="SampleProject";
 

  Future <void> SignUpFunction(String email ,dynamic password)async{
  try {
   UserCredential cred= await _auth.createUserWithEmailAndPassword(email:email,password:password);
    Studentdata newData= Studentdata(id: cred.user!.uid, email: email, password: password);
    await _firestore.collection(_collection).doc().set(newData.toJson());
  }on Exception catch (e) {
    log("Error:$e");
    rethrow;
  }catch(e){
    log("Error:$e");
    rethrow;
  }
  }
  
  Future <void> SigninFunction(String email, dynamic password)async{
  try {
    await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }on Exception catch (e) {
    log("Error:$e");
    rethrow;
  }catch(e){
    log("Error:$e");
    rethrow;
  }
  }

  Future <void> SignOut()async{
  await FirebaseAuth.instance.signOut();
  }

}