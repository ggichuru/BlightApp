class Users {
  final String id;
  final String name;
  final String email;

  Users({this.id, this.name, this.email});

  Users.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email
    };
  }
}
