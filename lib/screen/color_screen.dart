import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/slider_provider.dart';

class ColorScreen extends ConsumerWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('print');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider);
            return Container(
              height: 200,
              width: 200,
              color: Colors.green.withOpacity(slider.slider),
            );
          }),
          Consumer(builder: (context, ref, child){
            final slider = ref.watch(sliderProvider);
            return Slider(value: slider.slider, onChanged: (value){
              final stateProvider = ref.read(sliderProvider.notifier);
              stateProvider.state = stateProvider.state.copyWith(slider: value);
            });
          })
        ],
      ),
    );
  }
}
