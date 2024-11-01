import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding hai bên
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 8, horizontal: 15), // Điều chỉnh padding bên trong
          hintText: "Tìm kiếm...",
          hintStyle: TextStyle(fontSize: 14), // Kích thước chữ của placeholder
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Làm cho viền tròn hơn
            borderSide: BorderSide(color: Color(0xFFA5A5A5)),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(5), // Reduced padding around the icon
            child: Container(
              width: 30, // Set a smaller width for the container
              height: 30, // Set a smaller height for the container
              decoration: BoxDecoration(
                color: Color(0xFF1EA5FC),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, size: 18), // Smaller icon size
                color: Colors.white,
                padding:
                    EdgeInsets.zero, // Remove default padding for the button
              ),
            ),
          ),
        ),
      ),
    );
  }
}
