import 'package:app_section_27/utils/state/finit_state.dart';
import 'package:app_section_27/view/screen/prioritas_1/prioritas_1_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Prioritas1Screen extends StatefulWidget {
  static const String routeName = '/prioritas1';

  const Prioritas1Screen({super.key});

  @override
  State<Prioritas1Screen> createState() => _Prioritas1ScreenState();
}

class _Prioritas1ScreenState extends State<Prioritas1Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<Prioritas1ViewModel>(context, listen: false);

      provider.fetchFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas Prioritas 1'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text('Fetch Data Food From API'),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<Prioritas1ViewModel>(builder: (context, provider, _) {
                switch (provider.myState) {
                  case MyState.initial:
                    return const Center(
                      child: Text('No Data Found'),
                    );
                  case MyState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case MyState.loaded:
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.foods.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(provider.foods[index].id.toString()),
                            subtitle:
                                Text(provider.foods[index].name.toString()),
                          ),
                        );
                      },
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
