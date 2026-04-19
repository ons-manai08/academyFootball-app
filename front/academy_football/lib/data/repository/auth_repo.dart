import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../constant/app_constant.dart';
import '../../data/api.dart';

class AuthRepository extends GetxService {
  final Api apiClient;
  AuthRepository({required this.apiClient});

  Future<Response> postSignUp(Map body) async {
    return await apiClient.postRequest(AppConstants.SIGNUP_URI,body);
  }
  Future<Response> postSignIn(Map body) async {
    return await apiClient.postRequest(AppConstants.SIGNIN_URI,body);
  }
}