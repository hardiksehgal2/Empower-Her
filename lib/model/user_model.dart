
class UserModel{
  String? name;
  String? id;
  String? phone;
  String? childEmail;
  String? parentEmail;
  String? type;

  UserModel({this.name,this.childEmail,this.parentEmail,this.phone,this.id,this.type});
  Map<String,dynamic> toJson() => {
    'name':name,
    'phone':phone,
    'id':id,
    'childEmail':childEmail,
    'parentEmail':parentEmail,
    'type':type,
  };
}