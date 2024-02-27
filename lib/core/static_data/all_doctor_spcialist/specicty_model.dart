import 'package:animated_custom_dropdown/custom_dropdown.dart';

class SpecialtyModel with CustomDropdownListFilter {
  int? id;
  String? specialtyAr;
  String? specialtyEn;

  SpecialtyModel({
    required this.id,
    required this.specialtyAr,
    required this.specialtyEn,
  });

  @override
  String toString() {
    return '$specialtyAr - $specialtyEn';
  }

  @override
  bool filter(String query) {
    return specialtyEn!.toLowerCase().contains(query.toLowerCase());
  }
}
