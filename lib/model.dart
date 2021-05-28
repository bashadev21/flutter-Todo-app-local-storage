class Note{
  String name;
  String address;
  Note({this.name,this.address});

  factory Note.fromJson(Map<String,dynamic> json)=>Note(
  name:json['name'],
  address: json['address']
  );

  Map<String,dynamic> toJson()=>{
    'name':name,
    'address':address
  };
}