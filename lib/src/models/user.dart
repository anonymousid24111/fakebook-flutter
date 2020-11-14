class UserModel {
  String _id = '-1';
  String _firstName='';
  String _lastName = '';
  String _avatar = '';
  String _email = '';
  String _phone = '';
  String _birthday = '';
  String _password = '';
  String _genre = '';


  UserModel.empty();

  UserModel(this._id, this._firstName, this._lastName, this._avatar,
      this._email, this._phone, this._birthday, this._password, this._genre);

  

  UserModel.fromJson(Map json) {
    this.id = json['id'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.avatar = json['avatar'];
    this.birthday = json['birthday'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.password = json['password'];
    this.genre = json['genre'];
  }

  Map userToMap() => new Map<String, dynamic>.from({
        "id": this.id,
        "first_name": this.firstName,
        "last_name": this.lastName,
        "avatar": this.avatar,
        "email": this.email,
        "phone": this.phone,
        "password": this.password,
        "birthday": this.birthday,
        "genre": this.genre
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


  String get genre => _genre;

  set genre(String value) {
    _genre = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
