
import 'package:estados_app/config/helpers/random_generator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_provider.g.dart';

@riverpod
Stream<List<String>> usersInChat(UsersInChatRef ref) async*{
  final names= <String>[];
  //yield names;

  await for(final name in RandomGenerator.randomNameStream()){
    names.add(name);
    yield names;
  }

  
}