/**
 * @Author: Carlos Galeano
 * @Date:   2025-03-25 18:11:55
 * @Last Modified by:   Carlos Galeano
 * @Last Modified time: 2025-03-25 18:12:17
 */
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú de Despachos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              text: 'Consultar Despachos',
              onPressed: () {
                print("Consultar Despachos");
              },
            ),
            MenuButton(
              text: 'Actualizar Despacho',
              onPressed: () {
                print("Actualizar Despacho");
              },
            ),
            MenuButton(
              text: 'Validar Entrega',
              onPressed: () {
                print("Validar Entrega");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MenuButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
