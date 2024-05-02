import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/consts/consts.dart';
import 'package:medical_app/consts/lists.dart';
import 'package:medical_app/views/category_details_view/category_details_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppStyles.bold(
            title: AppStrings.category,
            size: AppSizes.size18,
            color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: IconsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() =>  CategoryDetailsView(catName: iconsTitleList[index],));
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.blueColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        IconsList[index],
                        width: 60,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    30.heightBox,
                    AppStyles.bold(
                      title: iconsTitleList[index],
                      color: AppColors.whiteColor,
                      size: AppSizes.size16,
                    ),
                    10.heightBox,
                    AppStyles.normal(
                      title: "3 specialists",
                      color: AppColors.whiteColor.withOpacity(0.5),
                      size: AppSizes.size12,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
