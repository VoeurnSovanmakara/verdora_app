enum AddressType {
  home('HOME'),
  work('WORK'),
  school('SCHOOL'),
  other('OTHER');

  const AddressType(this.value);
  final String value;

  static AddressType fromJson(String? json) {
    switch (json) {
      case 'HOME':
        return AddressType.home;
      case 'WORK':
        return AddressType.work;
      case 'SCHOOL':
        return AddressType.school;
      case 'OTHER':
      default:
        return AddressType.other;
    }
  }
}
