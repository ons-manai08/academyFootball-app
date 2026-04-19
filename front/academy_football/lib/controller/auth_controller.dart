import 'package:academy_football/coach/dashbord_coach.dart';
import 'package:academy_football/joueur/dashbord_joueur.dart';
import 'package:academy_football/parent/dashboard_parent.dart';
import 'package:get/get.dart';
import '../base/showCustomSnackbar.dart';
import '../constant/app_constant.dart';
import '../data/repository/auth_repo.dart';
import '../login_page.dart';
import '../main.dart';

import '../models/user_model.dart';



class AuthController extends GetxController {
  final AuthRepository authRepository;
  List<String> role=[];
  AuthController(this.authRepository);


  Future signUp(String user, String email, String password,String r) async {
    print("in signup");
    role=[r];
    Response response = await authRepository.postSignUp(
        {"username": user,  "email": email, "password": password, "role": role});
    if (response.statusCode==200 ||response.statusCode==201) {
      showCustomSnackbar("All went well ", title: "Perfect");
      Get.to(LoginPage());
    }
    else{
      showCustomSnackbar("User Not Found ", title: "Erore");

    }
  }

  Future signIn(String username, String password) async {
    Response response = await authRepository.postSignIn(
        {"username": username,  "password": password});
    if (response.statusCode==200 ||response.statusCode==201) {
      UserModel user = UserModel.fromJson(response.body);
      sharedPreferences.clear();
      sharedPreferences.setString(AppConstants.USER_ID, user!.id.toString());
      sharedPreferences.setString(AppConstants.USER_NAME, user!.username.toString());
      sharedPreferences.setString(AppConstants.USER_EMAIL, user!.email.toString());
      sharedPreferences.setString(AppConstants.USER_ROLE, user!.roles.toString());
      sharedPreferences.setString(AppConstants.USER_TOKEN, user!.accessToken.toString());
      if(user.roles![0]=="ROLE_JOUEUR"){
        String? value = sharedPreferences.getString(AppConstants.USER_ROLE);
        print(value);
        Get.off(Dashboard_joueur());
      }else if(user.roles![0]=="ROLE_COACH"){
        Get.off(DashboardCoach());
      }else if(user.roles![0]=="ROLE_PARENT"){
        Get.off(DashboardParent());
      }

    }
    else{
      showCustomSnackbar("User Not Found ", title: "Erore");
    }
  }

  void lougOut() {
    sharedPreferences.clear();
    Get.off(LoginPage());
  }
}