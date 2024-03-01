import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:web_f1/Provider/HomePageProvider.dart';

class MyHomePage extends ConsumerStatefulWidget  {
  const MyHomePage({super.key});

@override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

 @override
  Widget build(BuildContext context) {
    final List<int> years = ref.watch(yearProvider);
    final yearChoosed = ref.watch(yearChoosedProvider);
    final raceNames = ref.watch(raceNameProvider(yearChoosed));
    final raceNameChoosed = ref.watch(raceNameChoosedProvider);

    final yearSelected = ref.watch(yearSelectedProvider);
    final buttonActive = ref.watch(buttonActiveProvider);

    return Wrap(
      alignment : WrapAlignment.center,
      children: [
        DropdownMenu(
            label: const Text('Year'),
            controller: TextEditingController(),
            dropdownMenuEntries: years.map((e) => DropdownMenuEntry(value: e, label: e.toString())).toList(),
            onSelected: ((int? year) {
              ref.read(yearChoosedProvider.notifier).state = year!;
              ref.read(yearSelectedProvider.notifier).state = true;
            }),
        ),
        const SizedBox(width: 20),
        DropdownMenu(
          label: const Text('Race'),
          width: 200,
          controller: TextEditingController(),
          trailingIcon: raceNames.isLoading ? const CircularProgressIndicator() : const Icon(Icons.arrow_drop_down),
          enabled: !raceNames.isLoading && yearSelected,
          dropdownMenuEntries:  raceNames.isLoading
                                ? List<DropdownMenuEntry<int>>.empty() 
                                : raceNames.value!.map((e) => DropdownMenuEntry(value: e.round, label: e.raceName)).toList(),
          onSelected: (int? raceNumber) {
            ref.read(raceNameChoosedProvider.notifier).state = raceNumber!;
            ref.read(buttonActiveProvider.notifier).state = true;
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: buttonActive ? () => context.goNamed('chart', pathParameters: {'year': '$yearChoosed', 'raceNumber': '$raceNameChoosed'}) : null,
            child: const Text("Search!"),
          ),
        )
      ],
    );
  }
}
