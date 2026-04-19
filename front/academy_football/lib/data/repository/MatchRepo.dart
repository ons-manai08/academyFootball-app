import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

import '../../constant/app_constant.dart';
import '../../data/api.dart';
class MatchRepo extends GetxService {

  final Api apiClient;

  MatchRepo(this.apiClient);

  Future<http.Response> getMatchList() async {
    return await apiClient.getRequest(AppConstants.BASE_URL+AppConstants.Match_URI);
  }
}
