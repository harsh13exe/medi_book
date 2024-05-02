import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medical_app/firebase_options.dart';
import 'package:medical_app/res/components/waiting_screen.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: const WaitingScreen(),
    );
  }
}
