
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  String info;
  //String num = "";
  Function(String) onCountChanged;
  Button(
      {super.key,
      required this.info,
      //required this.num,
      required this.onCountChanged});

  @override
  Widget build(BuildContext context) {
    if (info == "0") {
      return Container(
          width: 182,
          height: 80,
          child: ElevatedButton(
            onPressed: () {
              onCountChanged(info);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                backgroundColor: const Color.fromARGB(255, 46, 45, 45)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16), 
              child: Align(
              alignment: Alignment.centerLeft, 
              child: Text(
                info,
                style: const TextStyle(fontSize: 40),
              )) ,) 
          ));
    }
    if (info == ",") {
      return Container(
          clipBehavior: Clip.hardEdge,
          width: 100,
          height: 80,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ElevatedButton(
            onPressed: () {
              onCountChanged(info);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 46, 45, 45)),
            child: Text(
              info,
              style: const TextStyle(fontSize: 40),
            ),
          ));
    }
    if (info == "=") {
      return Container(
          clipBehavior: Clip.hardEdge,
          width: 90,
          height: 80,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ElevatedButton(
            onPressed: () {
              onCountChanged(info);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange),
            child: Text(
              info,
              style: const TextStyle(fontSize: 40),
            ),
          ));
    }

    if (info == '/' || info == 'x' || info == '-' || info == '+') {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ElevatedButton(
        onPressed: () {
          onCountChanged(info);
        },
        style: ElevatedButton.styleFrom(
           
            backgroundColor: Colors.orange),
        child: Text(
          info,
          style: const TextStyle(fontSize: 40),
        ),
      ),);
    }

    if (info == "AC" || info == "+/-" || info == "%") {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ElevatedButton(
        onPressed: () {
          onCountChanged(info);
        },
        style: ElevatedButton.styleFrom(
            
            backgroundColor: const Color.fromARGB(255, 134, 131, 131)),
        child: Text(
          info,
          style: const TextStyle(fontSize: 40, color: Colors.black),
        ),
      ));
    }

    return Container(
      clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(shape: BoxShape.circle),
      child: ElevatedButton(
      onPressed: () {
        onCountChanged(info);
      },
      style: ElevatedButton.styleFrom(
          
          backgroundColor: const Color.fromARGB(255, 46, 45, 45)),
      child: Text(
        info,
        style: const TextStyle(fontSize: 40),
      ),
    ));
  }
}
