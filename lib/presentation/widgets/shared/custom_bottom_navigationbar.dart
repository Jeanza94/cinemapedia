import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex  
  });

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined),
          label: 'Categorias'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outlined),
          label: 'Favoritos'
        ),

      ],
    );
  }
}