// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PropertyModel _$$_PropertyModelFromJson(Map<String, dynamic> json) =>
    _$_PropertyModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      profile:
          (json['profile'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as String?,
      type: json['type'] as String?,
      bed: json['bed'] as String?,
      bath: json['bath'] as String?,
      carParking: json['car_parking'] as String?,
      totalSize: json['total_size'] as String?,
      address: json['address'] as String?,
      shortAddress: json['short_address'] as String?,
      propertyId: json['property_id'] as int?,
      propertyName: json['property_name'] as String?,
      isfavorite: json['isfavorite'] as bool? ?? false,
      favoriteId: json['favoriteId'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_PropertyModelToJson(_$_PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'profile': instance.profile,
      'price': instance.price,
      'type': instance.type,
      'bed': instance.bed,
      'bath': instance.bath,
      'car_parking': instance.carParking,
      'total_size': instance.totalSize,
      'address': instance.address,
      'short_address': instance.shortAddress,
      'property_id': instance.propertyId,
      'property_name': instance.propertyName,
      'isfavorite': instance.isfavorite,
      'favoriteId': instance.favoriteId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
