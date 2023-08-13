import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> suggestions;
  final bool isexpanded;
  final String hinttext;

  const SearchTextField(
      {Key? key,
      required this.controller,
      required this.suggestions,
      required this.isexpanded,
      required this.hinttext})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  List<String> filteredSuggestions = [];

  @override
  void initState() {
    widget.controller.addListener(onSearchTextChanged);
    super.initState();
  }

  void onSearchTextChanged() {
    setState(() {
      String query = widget.controller.text.toLowerCase();
      filteredSuggestions = query.isEmpty
          ? []
          : widget.suggestions
              .where((suggestion) => suggestion.toLowerCase().contains(query))
              .toList();
    });
  }

  void onSuggestionTapped(String suggestion) {
    // Set the tapped suggestion in the TextField
    widget.controller.text = suggestion;

    // Unfocus the TextField to dismiss the keyboard
    FocusScope.of(context).unfocus();
    setState(() {
      filteredSuggestions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: widget.isexpanded ? MediaQuery.of(context).size.width : 276,
            child: TextField(
              textAlign: TextAlign.center,
              controller: widget.controller,
              onChanged: (value) => onSearchTextChanged(),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF868889),
                  size: 30,
                ),
                // suffixIcon: Icon(

                // ),
                hintText: widget.hinttext,
                hintStyle: const TextStyle(
                  color: Color(0xFF868889),
                ),
                filled: true,
                fillColor: const Color(0xffF8F9FB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        if (filteredSuggestions.isNotEmpty)
          SingleChildScrollView(
            child: Container(
              height: 40,
              width: 300,
              color: Colors.white,
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: filteredSuggestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(filteredSuggestions[index]),
                    onTap: () {
                      onSuggestionTapped(filteredSuggestions[index]);
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
