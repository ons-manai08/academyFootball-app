import 'dart:convert';

import 'package:academy_football/models/Entrainement.dart';
import 'package:get/get.dart';
import '../data/repository/EntrainRepo.dart';
import '../models/Match.dart';
import '../data/repository/MatchRepo.dart';
import 'package:http/http.dart' as http;

class EntrainController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    getEntrainementList();
  }

  final EntrainRepo entrainRepo;
  EntrainController(this.entrainRepo);


  List<Entrainement> _entrainementList = [];

  List<Entrainement> get entrainementList => _entrainementList;

// late CartController _cart;
  bool _isLoading = false;  //page trecherchi

  bool get isLoading => _isLoading;

  Future<void> getEntrainementList() async {
    _entrainementList = [];
    _isLoading = true;
    http.Response response = await entrainRepo.getEntrainementList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("in 200");
      final List<dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList.length; i++) {
        _entrainementList.add(Entrainement.fromJson(responseList[i]));
        update();
      }
      _isLoading = false;
      update();
      print("match list length: ${_entrainementList.length}");
      print(_entrainementList[0].lieu);
    }
    else {
      print("match else ${response.statusCode}");
      print(response.body);
      _isLoading = false;
      update();
    }
  }
}
