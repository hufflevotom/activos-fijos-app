import 'package:flutter/material.dart';
import 'package:activos_fijos_app/Utils/Styles/styles.dart';
import 'package:activos_fijos_app/Utils/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorBackground(
        color: CustomColors.azul_80,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CustomCard(
                color: CustomColors.rojo_100,
                child: const _Indicador(
                  tipo: '1',
                  value: '123',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCard(
                color: CustomColors.verde_100,
                child: const _Indicador(
                  tipo: '2',
                  value: '1223',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCard(
                color: CustomColors.amarillo_100,
                child: const _Indicador(
                  tipo: '3',
                  value: '123423',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCard(
                color: CustomColors.blanco,
                child: _Actividades(),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class _Indicador extends StatelessWidget {
  final String tipo;
  final String value;

  const _Indicador({Key? key, required this.tipo, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          tipo == "1"
              ? Icons.library_books_outlined
              : tipo == "2"
                  ? Icons.settings
                  : tipo == "3"
                      ? Icons.contact_page_outlined
                      : Icons.ac_unit,
          color: CustomColors.blanco,
          size: 60,
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            Text(
              value,
              style: TextStyle(
                  color: CustomColors.blanco,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              tipo == "1"
                  ? "Activos Fijos"
                  : tipo == "2"
                      ? "Mantenimientos"
                      : tipo == "3"
                          ? "Proveedores"
                          : 'null',
              style: TextStyle(
                  color: CustomColors.blanco,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}

class _Actividades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text('a')],
        ),
        Row(
          children: [Text('a')],
        )
      ],
    );
  }
}
