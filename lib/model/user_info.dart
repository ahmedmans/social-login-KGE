class UserInfo {
  String? displayName;
  String? email;
  String? photoUrl;

  UserInfo({this.displayName, this.email, this.photoUrl});

  UserInfo.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    email = json["email"];
    photoUrl = json["photoUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["displayName"] = displayName;
    data["email"] = email;
    data["photoUrl"] = photoUrl;

    return data;
  }
}
