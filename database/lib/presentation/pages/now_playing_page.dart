import 'package:database/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingPage extends ConsumerWidget {
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = ref.watch(nowWatchingStreamProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('En reproducción')),
      body: now.when(
        data: (w) {
          if (w == null) return const Center(child: Text('Nada en reproducción'));
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Episodio ${w.episodeId} — progreso: ${w.progressMinutes} min'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Reanudar'),
                ),
                if (w.streamUrl != null && w.streamUrl!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () async {
                      // In a full app we would use url_launcher; here we just display the URL.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('URL: ${w.streamUrl}')));
                    },
                    icon: const Icon(Icons.link),
                    label: const Text('Abrir enlace'),
                  ),
                ],
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}


