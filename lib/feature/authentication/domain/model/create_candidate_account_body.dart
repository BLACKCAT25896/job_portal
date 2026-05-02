class CreateCandidateAccountBody {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;

  CreateCandidateAccountBody(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.password,
        this.passwordConfirmation,
        });

  CreateCandidateAccountBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;

    return data;
  }
}
