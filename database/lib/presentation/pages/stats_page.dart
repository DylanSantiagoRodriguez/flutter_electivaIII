import 'package:database/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statsProvider = FutureProvider((ref) async {
  final repo = ref.read(repositoryProvider);
  final hoursByGenre = await repo.totalHoursWatchedByGenre();
  final nightFinales = await repo.seasonFinalesWatchedBetween(0, 5);
  final mostPaused = await repo.mostPausedShowTitle();
  return (hoursByGenre: hoursByGenre, nightFinales: nightFinales, mostPaused: mostPaused);
});

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: stats.when(
        data: (s) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Horas vistas por género', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...s.hoursByGenre.entries.map((e) => Text('${e.key}: ${e.value.toStringAsFixed(1)} h')),
            const Divider(height: 32),
            Text('Finales de temporada vistos entre 00:00 y 05:00: ${s.nightFinales}'),
            const Divider(height: 32),
            Text('Serie más pausada a mitad: ${s.mostPaused ?? 'N/D'}'),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}


