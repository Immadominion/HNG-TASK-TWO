import 'package:get_it/get_it.dart';

import '../data/services/error_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<ErrorService>(
    () => ErrorService(),
  );
}
