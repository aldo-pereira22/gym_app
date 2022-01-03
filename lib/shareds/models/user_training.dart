import 'package:gym_app/shareds/models/user_abstract.dart';
import 'package:gym_app/shareds/models/user_client.dart';

class UserTrainer extends AbstractUser {
  // Lista de ID dos clientes
  List<int> listClientIds;

  // Lista dos clientes;
  List<UserClient> listClient;
}
