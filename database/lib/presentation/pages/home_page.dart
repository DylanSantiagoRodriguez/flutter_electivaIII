import 'package:database/domain/entities/enums.dart';
import 'package:database/presentation/providers.dart';
import 'package:database/presentation/pages/add_show_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showsAsync = ref.watch(showsListProvider);
    final filter = ref.watch(showsFilterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tracker')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Buscar...'),
                  onChanged: (v) => ref.read(showsFilterProvider.notifier).setQuery(v),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String?>(
                value: filter.genre,
                hint: const Text('Género'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Todos')),
                  DropdownMenuItem(value: 'Drama', child: Text('Drama')),
                  DropdownMenuItem(value: 'Comedia', child: Text('Comedia')),
                  DropdownMenuItem(value: 'Acción', child: Text('Acción')),
                ],
                onChanged: (v) => ref.read(showsFilterProvider.notifier).setGenre(v),
              ),
              const SizedBox(width: 8),
              DropdownButton<ShowType?>(
                value: filter.type,
                hint: const Text('Tipo'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('Todos')),
                  DropdownMenuItem(value: ShowType.series, child: Text('Serie')),
                  DropdownMenuItem(value: ShowType.movie, child: Text('Película')),
                ],
                onChanged: (v) => ref.read(showsFilterProvider.notifier).setType(v),
              ),
            ]),
          ),
          Expanded(
            child: showsAsync.when(
              data: (list) => ListView.builder(
                itemCount: list.length,
                itemBuilder: (c, i) => ListTile(
                  title: Text(list[i].title),
                  subtitle: Text('${list[i].genre} • ${list[i].year}'),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final saved = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddShowPage()));
          if (saved == true) {
            ref.refresh(showsListProvider);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Añadir'),
      ),
    );
  }
}


