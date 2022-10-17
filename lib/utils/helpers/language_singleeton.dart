import 'package:sos_mobile/utils/model/language_model/language_model.dart';

class LanduageSingleton {
  static final LanduageSingleton _landuageSingleton =
      LanduageSingleton._internal();
  LanduageSingleton._internal();
  static LanduageSingleton get instance => _landuageSingleton;
  LanduageModel? landuageModel = LanduageModel();
}
