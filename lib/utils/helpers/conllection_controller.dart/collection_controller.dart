import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'collection_controller.config.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
