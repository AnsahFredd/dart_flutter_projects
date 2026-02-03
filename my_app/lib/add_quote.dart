import 'package:flutter/material.dart';
import 'package:my_app/quotes.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({super.key});

  @override
  State<AddQuote> createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  final TextEditingController _controller = TextEditingController();
  List<String> userquote = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addQuote() {
      var userinput = _controller.text.trim();
       
       if (userinput.isNotEmpty) {
        setState(() {
          userquote.add(userinput);
        });
        _controller.clear();
       }
  }

  void deleteQuote(String quote) {
    setState(() {
      userquote.remove(quote);
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: AssetImage('assets/images/quote.avif'),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              ),
          ),
          SizedBox(height: 70,),
          Column(           
            children: [
              TextField(
                controller: _controller,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  labelText: "Enter new quote",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(
                onPressed: () => addQuote(), 
                child: Text("Add Quote"),),
            ],
          ),
          Expanded(
            child: ListView(
              children: userquote.map((quote) {
                return QuoteCard(quote: quote, delete: () => deleteQuote(quote));
              }).toList(),
            )
          )
        ],
      
      ),
      );
  }
}