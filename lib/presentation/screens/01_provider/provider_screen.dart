import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/simple_name_provider.dart';

//*ConsumerWidget , es como un statelessWidget
class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name= ref.watch(simpleNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body:  Center(
        child: Text(name),
      ),
    );
  }
}
//* ConsumerStatefullWidget
class ProviderScreenStateful extends ConsumerStatefulWidget {
  const ProviderScreenStateful({super.key});

  @override
  ProviderScreenStatefulState createState() => ProviderScreenStatefulState();
}

class ProviderScreenStatefulState extends ConsumerState<ProviderScreenStateful> {
  @override
  Widget build(BuildContext context) {
    final name= ref.watch(simpleNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body:  Center(
        child: Text(name),
      ),
    );
  }
}