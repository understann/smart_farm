import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFF1F1F1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 0,
          menuMaxHeight: 300,
          isExpanded: true,
          value: widget.value,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFF1B4139),
            size: 50,
          ),
          items: widget.items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item,style: TextStyle(fontSize: 20),),
            );
          }).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
