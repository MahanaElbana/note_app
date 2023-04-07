
class UserModel {

  late final String id;
  late final String userName;
  late final String password;
  late final String phone;
  late final String email;


  UserModel({
    required this.id,
    required this.userName,
    required this.password ,
    required this.phone,
    required this.email ,

  });

  UserModel.fromJsonData({
    required String userId, 
    required Map jsonUserData,}) {
    id = userId;
    userName = jsonUserData['userName'];
    password = jsonUserData['password'];
    phone =    jsonUserData['phone'];
    email =    jsonUserData['email']  ;

  }

  Map<String , dynamic> toJsonData() {
    final Map<String, dynamic> data = <String, dynamic>{};
     data['id'] = id;
     data['userName'] = userName;
     data['password'] = password;
     data['phone'] = phone;
     data['email']  = email ;
    return data;
  }
}