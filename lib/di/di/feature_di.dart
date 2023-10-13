import 'package:get_it/get_it.dart';

abstract class FeatureDi {
  void initWith(GetIt injector) {
    initDao(injector);
    initDataSources(injector);
    initRepositories(injector);
    initMappers(injector);
    initUseCases(injector);
    initBlocks(injector);
  }

  void initDao(GetIt injector);

  void initDataSources(GetIt injector);

  void initRepositories(GetIt injector);

  void initMappers(GetIt injector);

  void initUseCases(GetIt injector);

  void initBlocks(GetIt injector);
}
