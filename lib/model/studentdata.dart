class Studentdata {
  final String id;
  final String email;
  final int password;

  Studentdata({
    required this.id,
    required this.email,
    required this.password
  });

  factory Studentdata.fromMap(Map<String,dynamic>json){
    return Studentdata(id: json["id"], email: json["email"], password: json["password"]);
  }

  Map<String,dynamic>toJson(){
    return{
      "id":id,
      "email":email,
      "password":password
    };
  }
}