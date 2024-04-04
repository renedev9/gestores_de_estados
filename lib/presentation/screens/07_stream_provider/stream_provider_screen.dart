import 'package:estados_app/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final usersInChat= ref.watch(usersInChatProvider);
//*Otra manera de hacer la validacion , se pudiera seguir haciendo con el .when(), como en el caso del future_provider y el family_provider
    if(!usersInChat.hasValue){
      return Center(child: CircularProgressIndicator(),);
    }
    return ListView.builder(
      itemCount: usersInChat.value!.length,
      itemBuilder: (BuildContext context, int index) {
        final name= usersInChat.value![index];
        return ListTile(title: Text(name),);
      },
    );
  }
}