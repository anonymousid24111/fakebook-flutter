class UserModel {
  String id = '';
  String phone = '';
  String password = '';
  String token = '';
  String username = '';
  String avatar = '';

  UserModel.empty();

  UserModel.author(this.id, this.avatar, this.username);

  UserModel(this.id, this.phone, this.password, this.token, this.username,
      this.avatar);


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.author(
      json['_id'],
      json['avatar'],
      json['username'],
    );
  }

  Map toJson() {
    return {'_id': id, 'avatar': avatar, 'username': username};
  }

  Map userToMap() => new Map<String, dynamic>.from({
        "id": this.id,
        "username": this.username,
        "avatar": this.avatar,
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

}
