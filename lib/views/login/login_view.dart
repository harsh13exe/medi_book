import 'package:get/get.dart';
import 'package:medical_app/constrollers/auth_controller.dart';
import 'package:medical_app/consts/consts.dart';
import 'package:medical_app/res/components/custom_button.dart';
import 'package:medical_app/res/components/custom_textfield.dart';
import 'package:medical_app/views/appointment_view/appoitment_view.dart';
import 'package:medical_app/views/home/home.dart';
import 'package:medical_app/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  AppAssets.imgLogin,
                  width: 150,
                ),
                10.heightBox,
                AppStyles.bold(
                    title: AppStrings.welcomeBack, size: AppSizes.size18),
                AppStyles.bold(title: AppStrings.weAreExcited)
              ],
            ),
            30.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  CustomTextField(
                      hint: AppStrings.email,
                      textController: controller.emailController),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textController: controller.passwordController,
                  ),
                  10.heightBox,
                  SwitchListTile(
                    value: isDoctor,
                    onChanged: (newValue) {
                      setState(() {
                        isDoctor = newValue;
                      });
                    },
                    title: "Sign in as a Doctor".text.make(),
                  ),
                  20.heightBox,
                  Align(
                      alignment: Alignment.centerRight,
                      child:
                          AppStyles.normal(title: AppStrings.forgetPassword)),
                  20.heightBox,
                  CustomBotton(
                      buttonText: AppStrings.login,
                      onTap: () async {
                        await controller.loginUser();
                        if (controller.userCredential != null) {
                          if (isDoctor) {
                            //signin as a doctor
                            Get.to(() => const AppointmentView());
                          } else {
                            //signin as a user
                            Get.to(() => const Home());
                          }
                        }
                      }),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppStyles.normal(title: AppStrings.dontHaveAccount),
                      8.widthBox,
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignupView());
                        },
                        child: AppStyles.bold(title: AppStrings.signup),
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
