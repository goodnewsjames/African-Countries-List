import 'package:african_countries/domain/models/country.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  const CountryTile(this.countryData, {required this.onPressed, required this.index, super.key});
  final Country countryData;
  final int index;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 30,
          child: Image.network(
            countryData.flag,
            fit: BoxFit.fill,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.error),
          ),
        ),
        title: Text(
          countryData.name,
          style: TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text(
          countryData.officialName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text(
          "${index + 1}",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
        onTap: onPressed,
        
      ),
    );
  }
}




// Row(
      //   mainAxisAlignment: MainAxisAlignment.end,

      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         width: 40,
      //         height: 30,
      //         child: Image.network(
      //           countryData.flag,
      //           fit: BoxFit.fill,
      //           errorBuilder:
      //               (context, error, stackTrace) =>
      //                   Icon(Icons.error),
      //         ),
      //       ),
      //     ),

      //     Text(
      //       countryData.name,
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         color: const Color.fromARGB(137, 53, 14, 14),
      //       ),
      //       overflow: TextOverflow.ellipsis,
      //       maxLines: 1,
      //     ),
      //     SizedBox(width: 300),
      //     Text(
      //       countryData.officialName,
      //       overflow: TextOverflow.ellipsis,
      //       maxLines: 1,
      //     ),
      //   ],
      // ),