import 'package:easy_openai/easy_openai.dart';
import 'package:flutter/material.dart';

class ModelsApiExample extends StatefulWidget {
  const ModelsApiExample({super.key});

  @override
  State<ModelsApiExample> createState() => _ModelsApiExampleState();
}

class _ModelsApiExampleState extends State<ModelsApiExample> {
  Future<List<AIModel>>? _getAllModels;

  @override
  void initState() {
    super.initState();

    _getAllModels = OpenAI.modelAPI.all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: _getAllModels,
                builder: (_, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    final data = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) => _modelItemBuilder(data[index]),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _modelItemBuilder(AIModel data) {
    return ListTile(
      title: Text(data.id),
    );
  }
}
