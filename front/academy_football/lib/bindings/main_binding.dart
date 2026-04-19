import 'package:academy_football/constant/app_constant.dart';
import 'package:academy_football/data/api.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/auth_controller.dart';
import '../controller/entrainement_controller.dart';
import '../controller/match_controller.dart';
import '../data/repository/EntrainRepo.dart';
import '../data/repository/MatchRepo.dart';
import '../data/repository/auth_repo.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() =>Api(appBaseUrl: AppConstants.BASE_URL));
    Get.lazyPut(() =>AuthRepository(apiClient: Get.find()));
    Get.lazyPut(() =>AuthController(Get.find()));
    Get.lazyPut(() =>MatchRepo(Get.find()));
    Get.lazyPut(() => MatchController(Get.find()));
    Get.lazyPut(() =>EntrainRepo(Get.find()));
    Get.lazyPut(() => EntrainController(Get.find()));
  }
}
