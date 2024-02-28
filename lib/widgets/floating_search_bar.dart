import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_status_5_days/models/models.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key, 
    this.cities
  });

  final List<String>? cities;

  @override
  Widget build(BuildContext context) {
    print(cities);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.pink.shade400,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      height: 50,
      width: 560,
      padding: const EdgeInsets.all(5),
      child: TypeAheadField(
        // textFieldConfiguration: TextFieldConfiguration(
        //   enableInteractiveSelection: false,
        //   onEditingComplete: () {
        //     //al dar enter con el teclado
        //   },
        //   autofocus: false,
        //   style: TextStyle(
        //     color: Colors.pink.shade400,
        //     fontSize: 20,
        //   ),
        //   // decoration: InputDecorationVentas._inputDecorationVentas(
        //   //   hintText: 'Guadalajara...',
        //   //   labelText: 'Ciudad',
        //   // ),
        // ),
        suggestionsCallback: (pattern) async {
          // return await _getProductosBuscar(pattern);
        },
        itemBuilder: (context, List<Cities> cities) {
          return ListTile(
            // title: Text(
            //   cities.isEmpty
            //   ? 'Escribe para buscar...'
              // : cities.citiesDescripcion
              // ),
            // subtitle: Text(
              // cities.citiesDescripcion.isEmpty
              // ? 'Ej. durazno'
              // : '\$${productos.productosPrecio}'
              // ),
          );
        },
        onSelected: (suggestion) async {
          
        }, 
      )
    );
  }
}