import 'package:get/get.dart';
import 'package:medical_app/constrollers/auth_controller.dart';
import 'package:medical_app/consts/consts.dart';
import 'package:medical_app/consts/lists.dart';
import 'package:medical_app/views/login/login_view.dart';

import '../../constrollers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Settingcontroller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: AppStrings.settings,
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Obx(
        () => controller.isLoading.value
            ?const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(AppAssets.imgSignup),
                    ),
                    title: AppStyles.bold(title:controller.username.value),
                    subtitle: AppStyles.normal(title:controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        SettingsList.length,
                        (index) => ListTile(
                              onTap: () {
                                if (index == 2) {
                                  AuthController().signout();
                                  Get.offAll(() => const LoginView());
                                }
                              },
                              leading: Icon(
                                settingsListIcons[index],
                                color: AppColors.blueColor,
                              ),
                              title: AppStyles.bold(title: SettingsList[index]),
                            )),
                  )
                ],
              ),
      ),
    );
  }
}
