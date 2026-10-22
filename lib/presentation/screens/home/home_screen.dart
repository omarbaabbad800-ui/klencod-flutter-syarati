import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/vehicle_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('سيارتي')),
      body: vehiclesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('خطأ: $err')),
        data: (vehicles) {
          if (vehicles.isEmpty) return const Center(child: Text('لا توجد سيارات'));
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final v = vehicles[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('${v.make} ${v.model}'),
                  subtitle: Text('${v.city} - ${v.dailyPrice} ريال/يوم'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.push('/vehicle-details/${v.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}