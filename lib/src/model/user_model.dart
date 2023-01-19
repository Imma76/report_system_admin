class UserModel{
  String? name;
  String? mobile;
  String? userId;
  String? email;


  UserModel({this.name,this.email,this.mobile,this.userId});

  UserModel.fromJson(Map<String, dynamic> data){
    name = data['name'];
    mobile = data['mobile'];
    email = data['email'];

  }
  toJson(){
    Map<String,dynamic> data={};

    data['mobile']= mobile;
    data['email'] = email;
    data['name'] = name;
    return data;

  }
}