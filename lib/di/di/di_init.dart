import 'package:dio/dio.dart';
import 'package:encrypt_shared_preferences/provider.dart';

import 'package:get_it/get_it.dart';
import 'package:hackathon/di/di/auth_di.dart';
import 'package:hackathon/di/di/feature_di.dart';

GetIt get injector => GetIt.instance;

class DependencyInitializer {
  static final List<FeatureDi> _features = [
    AuthDi(),
  ];

  static void ensureInitialized() {
    ///init all other feature module dependencies
    for (var element in _features) {
      element.initWith(injector);
    }
  }
}
