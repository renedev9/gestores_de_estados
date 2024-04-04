import 'package:estados_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    final randomName = ref.watch(randomNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: isDarkMode == false
                ? Icon(Icons.light_mode_outlined, size: 100)
                : Icon(Icons.dark_mode_outlined, size: 100),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
          Text(randomName, style: TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label:
                Text(counter.toString(), style: const TextStyle(fontSize: 100)),
            onPressed: () {
              ref.read(counterProvider.notifier).update((state) => state + 1);
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref.invalidate(randomNameProvider); //*Esto invalida el el provider , vuelve a ejecutar la funcion RandomGenerator.getRandomName(), esta manera es mas sencilla, aunque la otra via es igual de efectiva

          //! Via mas larga al llamar al mismo metodo que ejecuta el randomNameProvider
          //*ref.read(randomNameProvider.notifier).update((state) => RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
