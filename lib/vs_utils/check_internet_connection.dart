import 'package:connectivity_plus/connectivity_plus.dart';

class CheckPhoneInternetConnection{


  static Future<bool> checkConnection()async{
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet){
      return true;
    }else{
      return false;
    }
  }
}