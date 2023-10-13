import 'package:hackathon/domain/models/common/domain_result.dart';

abstract class AuthRepository {
  Future<DomainResult> login(String login, String password);

  Future<DomainResult> register(String login, String password);
}
