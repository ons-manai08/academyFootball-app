import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/match_controller.dart';

class MatchInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<MatchController>().getMatchtList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Match Information'),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo1.png',
              width: 200,
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Text(
                    'Match Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: Expanded(
                      child:GetBuilder<MatchController>(builder : (controller) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.matchtList[index].dateMatch.toString(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Lieu:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.matchtList[index].lieu.toString(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Equipe Home:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.matchtList[index].equipeHome.toString(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Adversaire:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.matchtList[index].adversaire.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                Divider(
                                  height: 5,
                                  color: Colors.black,
                                ),
                                SizedBox(height: 10),
                              ],
                            );
                          },
                          itemCount: controller.matchtList.length,
                        );
                      },)

                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
