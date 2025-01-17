

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
   // _connectivity.onConnectivityChanged.listen((connectivityResult){
    //});
    return connectivityResult.contains(ConnectivityResult.mobile) ||
           connectivityResult.contains(ConnectivityResult.wifi);
  }

  static bool? checkInternetConnection(){
    bool? isConnected;
   Connectivity().onConnectivityChanged.listen((List<ConnectivityResult>? results){
    if(results == null){
      isConnected = false;
      return;
    }
      if(results.contains(ConnectivityResult.mobile)|| results.contains(ConnectivityResult.wifi)){
        print('Connected Device');
        isConnected = true;
      }else if(results.contains(ConnectivityResult.none)){
        print('not connected');
        isConnected = false;
      }else{
        print('unknown connection');
        isConnected = true;
      }
    });
      return isConnected;
  }
 
}