import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';
part 'test.g.dart';

@freezed
class TestPage11 with _$TestPage11 {
  factory TestPage11({
    int? id,
    String? code,
    String? name,
    List? profile,
  }) = _TestPage11;

  factory TestPage11.fromJson(Map<String, dynamic> json) =>
      _$TestPage11FromJson(json);
}
