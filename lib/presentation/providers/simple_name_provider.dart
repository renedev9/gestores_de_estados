import 'package:estados_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final simpleNameProvider= Provider.autoDispose<String>((ref){
  return RandomGenerator.getRandomName();
});