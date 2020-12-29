class User {
  String username;
  String password;
  String address;

  User({this.username, this.password});
  User.from({this.username, this.password,this.address});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        address=json['address'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'address':address,
  };
}