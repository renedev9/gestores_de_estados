

import 'package:estados_app/config/helpers/random_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'states_providers.g.dart';

@Riverpod(keepAlive: true) //*Esto es parecido a la forma nativa de riverpod: .autodispose, en este caso mantiene la vida del provider,no se autodestuye
class Counter extends _$Counter {

@override
   int build() {
    return 5;
  }

  void increaseByOne(){
    state=state++;
  }

}

@riverpod
class DarKMode extends _$DarKMode {
  @override
  bool build() {
    return false;
  }

  void toggleDarkMode(){
    state= !state;
  }

}

@riverpod
class UserName extends _$UserName {
  @override
  String build() {
    return 'René Martínez';
  }

  void randomName(){
    state=RandomGenerator.getRandomName();
  }

}