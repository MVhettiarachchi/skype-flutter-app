class UserModel{

String uid;
String name;
String email;
String username;

UserModel({
this.uid,
this.name,
this.email,
this.username,
});


Map toMap(UserModel user){
var data= Map<String, dynamic>();
data['uid'] = user.uid;
data['name'] = user.name;
data['email'] = user.email;
data['username'] = user.username;
return data;
}

UserModel.fromMap(Map<String, dynamic> mapData){
  this.uid = mapData['uid'];
  this.name = mapData['name'];
  this.email = mapData['emai'];
  this.username= mapData['username'];
}
}