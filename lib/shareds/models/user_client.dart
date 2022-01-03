import 'package:gym_app/shareds/models/block_training.dart';
import 'package:gym_app/shareds/models/user_abstract.dart';

class UserClient extends AbstractUser {
  String uniqueCodeClient;
  List<TrainingBlock> listTraining;
}
