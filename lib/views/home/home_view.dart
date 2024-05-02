import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:medical_app/constrollers/home_controller.dart';
import 'package:medical_app/consts/lists.dart';
import 'package:medical_app/res/components/custom_textfield.dart';
import 'package:medical_app/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:medical_app/views/search_view/search_view.dart';

import '../../consts/consts.dart';
import '../category_details_view/category_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: "${AppStrings.welcome} ",
            size: AppSizes.size18,
            color: AppColors.blueColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColors.whiteColor,
                      textColor: Colors.white,
                      inputColor: AppColors.whiteColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: () {
                        Get.to(() => SearchView(
                              searchQuery:
                                  controller.searchQueryController.text,
                            ));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                  catName: iconsTitleList[index],
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 8),
                            child: Column(children: [
                              Image.asset(
                                IconsList[index],
                                width: 40,
                                color: AppColors.whiteColor,
                              ),
                              5.heightBox,
                              AppStyles.normal(
                                  title: iconsTitleList[index],
                                  color: Colors.white)
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppStyles.bold(
                        title: "Popular Doctors",
                        size: AppSizes.size18,
                        color: AppColors.blueColor),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var data = snapshot.data?.docs;
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => DoctorProfileView(
                                          doc: data[index],
                                        ));
                                  },
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: AppColors.bgDarkColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    margin: const EdgeInsets.only(right: 8),
                                    height: 100,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                          color: AppColors.blueColor,
                                          width: 150,
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            AppAssets.imgSignup,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        5.heightBox,
                                        AppStyles.normal(
                                            title: data![index]['docName']),
                                        5.heightBox,
                                        AppStyles.normal(
                                            title: data[index]['docCategory'],
                                            color: Colors.black54),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }),
                  5.heightBox,
                  20.heightBox,
                  Column(
                    children: [
                      Image.asset("assets/images/Top.png")
                    ],
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
