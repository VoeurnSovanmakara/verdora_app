import 'dart:convert';

import 'package:verdora_app/core/enum/src/address_type.dart';


class Address {
  const Address({
    this.id = 0,
    this.userId = '',
    this.name,
    this.phone = '',
    this.note,
    this.type = AddressType.other,
    this.lat = 0,
    this.lng = 0,
    this.detail = '',
  });

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      userId: map['userId'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] as String,
      note: map['note'] != null ? map['note'] as String : null,
      type: AddressType.fromJson(map['type'] as String),
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      detail: map['detail'] as String,
    );
  }


  final int id;
  final String userId;
  final String? name;
  final String phone;
  final String? note;
  final AddressType type;
  final double lat;
  final double lng;
  final String detail;

  static int currentAddressId = 0;

  Address copyWith({
    int? id,
    String? userId,
    String? name,
    String? phone,
    String? note,
    AddressType? type,
    double? lat,
    double? lng,
    String? detail,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      note: note ?? this.note,
      type: type ?? this.type,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'phone': phone,
      'note': note,
      'type': type.value,
      'lat': lat,
      'lng': lng,
      'detail': detail,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Address(id: $id, userId: $userId, name: $name, phone: $phone, note: $note, type: $type, lat: $lat, lng: $lng, detail: $detail)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.phone == phone &&
        other.note == note &&
        other.type == type &&
        other.lat == lat &&
        other.lng == lng &&
        other.detail == detail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        note.hashCode ^
        type.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        detail.hashCode;
  }
}
