import 'package:medical_app/consts/consts.dart';

class CustomBotton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomBotton({super.key,required this.buttonText,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 60,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        onPressed: onTap,
        child: buttonText.text.make(),
      ),
    );
  }
}
