import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_data.freezed.dart';
part 'property_data.g.dart';

@freezed
class PropertyModel with _$PropertyModel {
  factory PropertyModel({
  int? id,
    String? code,
    String? name,
    List<String>? profile,
    String? price,
    String? type,
    String? bed,
    String? bath,
    @JsonKey(name: 'car_parking') String? carParking,
    @JsonKey(name: 'total_size') String? totalSize,
    String? address,
    @JsonKey(name: 'short_address') String? shortAddress,
    @JsonKey(name: 'property_id') int? propertyId,
    @JsonKey(name: 'property_name') String? propertyName,
    @Default(false) bool isfavorite,
    int? favoriteId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
 
 

  }) = _PropertyModel;
 factory PropertyModel.fromJson(Map<String, dynamic> json) =>
_$PropertyModelFromJson(json);}