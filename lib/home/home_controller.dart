import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var status = false.obs;
  final UserFire = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  String greetUser() {
    DateTime now = DateTime.now();
    // String formattedTime = DateFormat.jm().format(now); // Format time as AM/PM
    int hour = now.hour;

    if (hour >= 0 && hour < 4) {
      return 'Good Night';
    } else if (hour >= 4 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  void main() {
    print('${greetUser()}, User!');
  }

  signOutFire() async {
    await FirebaseAuth.instance.signOut();
  }
}
