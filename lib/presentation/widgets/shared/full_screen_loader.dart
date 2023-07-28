
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  final messages = const<String>[
    'Cargando peliculas',
    'comprando palomitas de maiz',
    'Cargando populares',
    'Llamando a mi novia',
    'Ya mero',
    'Esto esta cargando mas de lo esperado :('
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(
      const Duration(microseconds: 1200),
      (step) {
        return messages[step];
      }
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere porfavor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando');
              return Text(snapshot.data!);
            } 
          )
        ],
      ),
    );
  }
}