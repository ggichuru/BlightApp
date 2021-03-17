class Users {
  final String uid;
  final String fullName;
  final String email;

  Users({this.uid, this.fullName, this.email});

  Users.fromData(Map<String, dynamic> data)
      : uid = data['id'],
        fullName = data['name'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'name': fullName,
      'email': email
    };
  }
}
