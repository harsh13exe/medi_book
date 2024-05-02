import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medical_app/consts/consts.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  bookAppointment(String docId, String docName, context) async {
    isLoading(true);
    var store = FirebaseFirestore.instance.collection('appointment').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMsg': appMessageController.text,
      'appWith': docId,
      'appWithName': docName,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment is booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments(
    bool isDoctor,
  ) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection('appointment')
          .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
    return FirebaseFirestore.instance
        .collection('appointment')
        .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
  }
}
