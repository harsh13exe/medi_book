import 'package:get/get.dart';
import 'package:medical_app/constrollers/auth_controller.dart';
import 'package:medical_app/consts/consts.dart';
import 'package:medical_app/res/components/custom_button.dart';
import 'package:medical_app/res/components/custom_textfield.dart';
import 'package:medical_app/views/home/home.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imgSignup,
                  width: 250,
                ),
                10.heightBox,
                AppStyles.bold(
                    title: AppStrings.signupNow,
                    size: AppSizes.size18,
                    alignment: TextAlign.center),
              ],
            ),
            30.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  CustomTextField(
                    hint: AppStrings.fullname,
                    textController: controller.fullnameController,
                  ),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.email,
                    textController: controller.emailController,
                  ),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textController: controller.passwordController,
                  ),
                  10.heightBox,
                  SwitchListTile(
                      title: "Sign up as a doctor".text.make(),
                      value: isDoctor,
                      onChanged: (newValue) {
                        setState(() {
                          isDoctor = newValue;
                        });
                      }),
                  Visibility(
                    visible: isDoctor,
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: 'About',
                          textController: controller.aboutController,
                        ),
                        10.heightBox,
                        CustomTextField(
                          hint: 'Category',
                          textController: controller.categoryController,
                        ),
                        10.heightBox,
                        CustomTextField(
                          hint: 'Service',
                          textController: controller.servicesController,
                        ),
                        10.heightBox,
                        CustomTextField(
                          hint: 'Address',
                          textController: controller.addressController,
                        ),
                        10.heightBox,
                        CustomTextField(
                          hint: 'Phone Number',
                          textController: controller.phoneController,
                        ),
                        10.heightBox,
                        CustomTextField(
                          hint: 'Timing',
                          textController: controller.timingController,
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  CustomBotton(
                      buttonText: AppStrings.signup,
                      onTap: () async {
                        await controller.signupUser(isDoctor);
                        if (controller.userCredential != null) {
                          Get.offAll(() => const Home());
                        }
                      }),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.alreadyHaveAccount),
                      8.widthBox,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppStyles.bold(title: AppStrings.login),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
