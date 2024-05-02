import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medical_app/views/doctor_profile_view/doctor_profile_view.dart';
import '../../consts/consts.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: AppStyles.bold(
            title: "Search Results",
            size: AppSizes.size18,
            color: AppColors.whiteColor),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 170,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var doc = snapshot.data!.docs[index];
                  return !doc['docName']
                          .toString()
                          .toLowerCase()
                          .contains(searchQuery)
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => DoctorProfileView(doc: doc));
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: AppColors.bgDarkColor,
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.only(right: 8),
                            height: 100,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: AppColors.blueColor,
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppAssets.imgSignup,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                5.heightBox,
                                AppStyles.normal(title: doc['docName']),
                                VxRating(
                                  onRatingUpdate: (value) {},
                                  selectionColor: AppColors.yellowColor,
                                  maxRating: 5,
                                  count: 5,
                                  value:
                                      double.parse(doc['docRating'].toString()),
                                  stepInt: true,
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
