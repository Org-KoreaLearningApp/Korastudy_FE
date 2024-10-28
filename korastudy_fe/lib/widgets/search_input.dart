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
              vertical: 8, horizontal: 12), // Điều chỉnh padding bên trong
          hintText: "Tìm kiếm...",
          hintStyle: TextStyle(fontSize: 14), // Kích thước chữ của placeholder
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Làm cho viền tròn hơn
            borderSide: BorderSide(color: Color(0xFFA5A5A5)),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4.0), // Thêm padding quanh icon
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1EA5FC),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search,
                    size: 20), // Kích thước biểu tượng nhỏ hơn
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
