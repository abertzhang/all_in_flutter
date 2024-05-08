class User {
  int? id;
  String? account;
  String? pwd;
  String? name;
  String? headImage;

  User({
    this.id,
    this.account,
    this.pwd,
    this.name,
    this.headImage,
  });

  factory User.fromMap(dynamic map) {
    if (null == map) return User();
    var temp;
    return User(
      id: null == (temp = map['id']) ? null : (temp is num ? temp.toInt() : int.tryParse(temp)),
      account: map['account']?.toString(),
      pwd: map['pwd']?.toString(),
      name: map['name']?.toString(),
      headImage: map['headImage']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account': account,
      'pwd': pwd,
      'name': name,
      'headImage': headImage,
    };
  }

  User copyWith({
    int? id,
    String? account,
    String? pwd,
    String? name,
    String? headImage,
  }) {
    return User(
      id: id ?? this.id,
      account: account ?? this.account,
      pwd: pwd ?? this.pwd,
      name: name ?? this.name,
      headImage: headImage ?? this.headImage,
    );
  }
}
