class User {
  dynamic id;
  dynamic name;
  dynamic phone_number;

  dynamic date_of_birth;
  dynamic image_path;
  dynamic account;
  dynamic password;
  // dynamic passwordHash;
  dynamic token_call;

  User({
    this.id,
    this.name,
    this.phone_number,
    this.date_of_birth,
    this.image_path,
    this.account,
    this.password,
    // this.passwordHash,
    this.token_call,
  });

  // User.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   phone_number = json['phone_number'];
  //   date_of_birth = json['date_of_birth'];
  //   image_path = json['image_path'];
  //   account = json['account'];
  //   password = json['password'];
  //   // passwordHash = json['passwordHash'];
  //   token_call = json['token_call'];
  // }
  factory User.fromJson(dynamic json) => User(
        id: json['id'],
        name: json['name'],
        phone_number: json['phone_number'],
        date_of_birth: json['date_of_birth'],
        image_path: json['image_path'],
        account: json['account'],
        password: json['password'],
        // passwordHash :json['passwordHash'],
        token_call: json['token_call'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phone_number;
    data['date_of_birth'] = this.date_of_birth;
    data['image_path'] = this.image_path;
    data['account'] = this.account;
    data['password'] = this.password;
    // data['passwordHash'] = this.passwordHash;
    data['token_call'] = this.token_call;
    return data;
  }
}
