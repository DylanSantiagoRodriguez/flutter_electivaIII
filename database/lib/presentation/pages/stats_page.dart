import 'package:database/presentation/providers.dart';
import 'package:database/domain/entities/enums.dart';
import 'package:database/domain/entities/show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statsProvider = FutureProvider((ref) async {
  final repo = ref.read(repositoryProvider);
  final hoursByGenre = await repo.totalHoursWatchedByGenre();
  final nightFinales = await repo.seasonFinalesWatchedBetween(0, 5);
  final mostPaused = await repo.mostPausedShowTitle();
  return (hoursByGenre: hoursByGenre, nightFinales: nightFinales, mostPaused: mostPaused);
});

final byStatusProvider = FutureProvider((ref) async {
  final repo = ref.read(repositoryProvider);
  final toWatch = await repo.searchShows(status: ShowStatus.toWatch);
  final inProgress = await repo.searchShows(status: ShowStatus.inProgress);
  final watched = await repo.searchShows(status: ShowStatus.watched);
  return (toWatch: toWatch, inProgress: inProgress, watched: watched);
});

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    final byStatus = ref.watch(byStatusProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: byStatus.when(
        data: (b) => stats.when(
          data: (s) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('Bitácora', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _StatusSection(title: 'Por ver', list: b.toWatch),
              const SizedBox(height: 12),
              _StatusSection(title: 'En progreso', list: b.inProgress),
              const SizedBox(height: 12),
              _StatusSection(title: 'Vistas', list: b.watched),
              const Divider(height: 32),
              const Text('Extras', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Horas vistas por género'),
              const SizedBox(height: 8),
              ...s.hoursByGenre.entries.map((e) => Text('${e.key}: ${e.value.toStringAsFixed(1)} h')),
              const SizedBox(height: 8),
              Text('Finales de temporada vistos 00:00–05:00: ${s.nightFinales}'),
              Text('Serie más pausada a mitad: ${s.mostPaused ?? 'N/D'}'),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text(e.toString())),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}

class _StatusSection extends StatelessWidget {
  final String title;
  final List<Show> list;
  const _StatusSection({required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        if (list.isEmpty) const Text('— vacío —')
        else ...list.map((s) => Text('• ${s.title} (${s.year})')),
      ],
    );
  }
}


