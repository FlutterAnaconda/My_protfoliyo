import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Providers/usertype.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> suggestions;
  final bool isexpanded;
  final String hinttext;
  final bool iscolorchanged;

  const SearchTextField(
      {Key? key,
      required this.controller,
      required this.suggestions,
      required this.isexpanded,
      required this.hinttext, required this.iscolorchanged})
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

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus(); // Close the keyboard
  }

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    final whichicon = Provider.of<Usertype>(
      context,
    );
    bool islocationicon = whichicon.islocationicon;
    return Column(
      children: [
        SizedBox(
          width: widget.isexpanded ? MediaQuery.of(context).size.width : 280,
          height: 49.41,
          child: TextField(
            // onTapOutside: (event) {
            //   setState(() {
            //     islocationicon = true;
            //     whichicon.isLocationIcon(islocationicon);
            //     _dismissKeyboard();
            //   });
            // },
            onTap: () {
              setState(() {
                islocationicon = false;
                whichicon.isLocationIcon(islocationicon);
              });
            },
            onSubmitted: (value) {
              setState(() {
                islocationicon = true;
                whichicon.isLocationIcon(islocationicon);
                _dismissKeyboard();
              });
            },
            controller: widget.controller,
            onChanged: (value) => onSearchTextChanged(),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFF868889),
                size: 16.32,
              ),
              // suffixIcon: Icon(

              // ),
              hintText: widget.hinttext,
              hintStyle: GoogleFonts.mulish(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF868889),
              ),
              filled: true,
              fillColor: widget.iscolorchanged ?Color(0xffEBF8EE):const Color.fromARGB(250, 240, 249, 250),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
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
