class UserModel {
  String id;
  String name;
  String email;
  String image;
  String username;
  String password;
  String role;
  String token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.username,
      this.password,
      this.role,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
