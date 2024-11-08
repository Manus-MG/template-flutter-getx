
import 'package:plot_management/app/core/utils/pref_utils.dart';

import '../../data/providers/apiClient/api_client.dart';
import '../network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
