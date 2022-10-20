// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../controller/utils_controller/utils_controller_api.dart' as _i4;
import '../../controller/utils_controller/utils_controller_function.dart'
    as _i5;
import '../api_base_helper/api_base_helper.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiBaseHelperGetConnect>(
      () => _i3.ApiBaseHelperGetConnect.init());
  gh.factory<_i4.UtilsControllerApi>(() => _i4.UtilsControllerApi.init());
  gh.factory<_i5.UtilsControllerFunction>(
      () => _i5.UtilsControllerFunction.init());
  return get;
}
