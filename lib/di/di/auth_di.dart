import 'package:get_it/get_it.dart';
import 'package:hackathon/di/di/feature_di.dart';
import 'package:hackathon/presentation/screens/auth/bloc/auth/login/login_bloc.dart';
import 'package:hackathon/presentation/screens/auth/bloc/auth/register/register_bloc.dart';

class AuthDi extends FeatureDi {
  @override
  void initDataSources(GetIt injector) {}

  @override
  void initMappers(GetIt injector) {}

  @override
  void initRepositories(GetIt injector) {}

  @override
  void initUseCases(GetIt injector) {}

  @override
  void initBlocks(GetIt injector) {
    injector.registerFactory<LoginBloc>(() => LoginBloc());
    injector.registerFactory<RegisterBloc>(() => RegisterBloc());
  }

  @override
  void initDao(GetIt injector) {
    //
  }
}
