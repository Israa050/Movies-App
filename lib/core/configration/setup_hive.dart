

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_neon_design/core/model/media.dart';
import 'package:path_provider/path_provider.dart' ;

Future<void> setupHive()async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(MediaAdapter());
 // await Hive.openBox<Media>(Constants.moviesBox);
}
