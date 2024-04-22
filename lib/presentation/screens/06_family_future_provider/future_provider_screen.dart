import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';


class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId=1;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync=ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body:  Center(
        child: pokemonAsync.when(data: (data)=> Text(data), error: (_, __) => Text('No se pudo cargar el nombre'), loading: ()=> CircularProgressIndicator()),
      ),
      floatingActionButton:  Column(
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon( Icons.refresh ),
            onPressed: () {
              pokemonId++;
              setState(() {
                
              });
              },
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: '2',
            child: const Icon( Icons.minimize_outlined ),
            onPressed: () {
              pokemonId--;
              setState(() {
                
              });
              },
          ),
        ],
      ),
    );
  }
}