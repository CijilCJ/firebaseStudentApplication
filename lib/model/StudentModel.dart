class Studentmodel {
  final String id;
  final String Name;
  final int Age;
  final String Address;
  final String imagePath;

  Studentmodel ({
    required this.id,
    required this.Name,
    required this.Age,
    required this.Address,
    required this.imagePath
  });

  factory Studentmodel.fromMap(Map<String,dynamic>json,String id){
    return Studentmodel(
      id: json["id"], 
      Name: json["Name"], 
      Age: json["Age"], 
      Address: json["Address"], 
      imagePath: json["imagePath"]
      );
  }
  Map<String,dynamic>toMap(){
    return{
      "id":id,
      "Name":Name,
      "Age":Age,
      "Address":Address,
      "image":imagePath
    };
  }
}