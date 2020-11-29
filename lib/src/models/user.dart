class UserModel {
  String _id = '';
  String _phone = '';
  String _password = '';
  String _token = '';
  String _username = '';
  String _avatar = '';

  UserModel(this._id, this._phone, this._password, this._token, this._username,
      this._avatar);

  UserModel.empty();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['phone'],
      json['password'],
      json['token'],
      json['username'],
      json['avatar'],
    );
  }

  Map userToMap() => new Map<String, dynamic>.from({
        "id": this.id,
        "username": this.username,
        "avatar": this.avatar,
        "phone": this.phone,
        "password": this.password,
      });

  static List<Map> userToListMap(List<UserModel> users) {
    List<Map> usersMap = [];
    users.forEach((UserModel user) {
      Map step = user.userToMap();
      usersMap.add(step);
    });
    return usersMap;
  }

  static List<UserModel> fromListMap(List<Map> maps) {
    List<UserModel> users = [];
    maps.forEach((element) {
      users.add(UserModel.fromJson(element));
    });
    return users;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }
}
