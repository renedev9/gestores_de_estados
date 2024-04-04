import 'package:estados_app/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final pokemonAsync= ref.watch(pokemonNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body:  Center(
        child: pokemonAsync.when(data: (data)=> Text(data), error: (_, __) => Text('No se pudo cargar el nombre'), loading: ()=> CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.refresh ),
        onPressed: () {
          ref.watch(pokemonIdProvider.notifier).update((state) => state+1);
          },
      ),
    );
  }
}