class User {
  final String? token;
  // final int? id;
  // final String? fullname;
  // final String? birthdate;
  // final String? birthplace;
  // final String? username;
  // final String? email;
  // final String? nik;
  // final String? address;
  // final String? gender;
  // final EmployeePhotos? photos;

  User({
    this.token,
    // this.id,
    // this.fullname,
    // this.birthdate,
    // this.birthplace,
    // this.username,
    // this.email,
    // this.nik,
    // this.address,
    // this.gender,
    // this.photos,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      // id: json['id'],
      // fullname: json['fullname'],
      // birthdate: json['birthdate'],
      // birthplace: json['birthplace'],
      // username: json['username'],
      // email: json['email'],
      // nik: json['nik'],
      // address: json['address'],
      // gender: json['gender'],
      // photos: json['photos'] != null ? EmployeePhotos.fromJson(json['photos']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      // 'id': id,
      // 'fullname': fullname,
      // 'birthdate': birthdate,
      // 'birthplace': birthplace,
      // 'username': username,
      // 'email': email,
      // 'nik': nik,
      // 'address': address,
      // 'gender': gender,
      // 'photos': photos?.toJson(),
    };
  }
}

class EmployeePhotos {
  final String? front;
  final String? left;
  final String? right;

  EmployeePhotos({this.front, this.left, this.right});

  factory EmployeePhotos.fromJson(Map<String, dynamic> json) {
    return EmployeePhotos(
      front: json['front'],
      left: json['left'],
      right: json['right'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'front': front,
      'left': left,
      'right': right,
    };
  }
}
