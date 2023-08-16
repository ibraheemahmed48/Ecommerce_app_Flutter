import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  final String email;
  final String address;
  final String type;
  final String token;
  final List<dynamic> cart;

  User({required this.id, required this.name, required this.password
    , required this.address, required this.type, required this.token, required this.email,
    required this.cart});

  factory User.getNewEmpty() {
    return User(
        id: '',
        name: '',
        password: '',
        address: '',
        type: '',
        token: '',
        email: '',
        cart: []
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "password": password,
      "address": address,
      "type": type,
      "token": token,
      "email": email,
      "cart": cart
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
        id: json["_id"] ?? '',
        name: json["name"] ?? '',
        password: json["password"] ?? '',
        address: json["address"] ?? '',
        type: json["type"] ?? '',
        token: json["token"] ?? '',
        email: json["email"] ?? '',
        cart: List<Map<String, dynamic>>.from(
          json['cart']?.map(
                (x) => Map<String, dynamic>.from(x),
          ),
        )
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? password,
    String? email,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}