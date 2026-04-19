import 'dart:convert';

import 'package:get/get.dart';
import '../models/Match.dart';
import '../data/repository/MatchRepo.dart';
import 'package:http/http.dart' as http;

class MatchController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getMatchtList();
  }

  final MatchRepo matchRepo;
  MatchController(this.matchRepo);


  List<MatchModel> _matchtList = [];

  List<MatchModel> get matchtList => _matchtList;

// late CartController _cart;
  bool _isLoading = false;  //page trecherchi

  bool get isLoading => _isLoading;

  Future<void> getMatchtList() async {
    _matchtList = [];
    _isLoading = true;
    print("in test getMatchtList");
    http.Response response = await matchRepo.getMatchList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("in 200");
      final List<dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList.length; i++) {
        _matchtList.add(MatchModel.fromJson(responseList[i]));
        update();
      }
      _isLoading = false;
      update();
      print("match list length: ${_matchtList.length}");
      print(_matchtList[0].lieu);
    }
    else {
      print("match else ${response.statusCode}");
      print(response.body);
      _isLoading = false;
      update();
    }
  }
}
