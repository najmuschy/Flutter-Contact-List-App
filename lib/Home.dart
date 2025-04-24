import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> names = [];
  List<String> numbers = [];

  _addContact() {
    setState(() {
      if (_nameController.text.isNotEmpty && _nameController.text.isNotEmpty) {
        names.add(_nameController.text);
        numbers.add(_numberController.text);
        _nameController.clear();
        _numberController.clear();
      }
    });
  }

  _deleteContact(int index) {
    setState(() {
      names.removeAt(index);
      numbers.removeAt(index);
    });
  }

  _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Contact',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: Text('Are you sure you want to delete this contact?'),
          actionsAlignment: MainAxisAlignment.end,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel, color: Colors.blue),
            ),
            IconButton(
              onPressed: (){
                _deleteContact(index);
                Navigator.of(context).pop() ;
              },

              icon: Icon(Icons.delete, color: Colors.blue),
            ),
          ],
        );
      },
    );
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Text(
            'Contact List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,

            child: TextButton(
              onPressed: _addContact,
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(102, 124, 137, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),

              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onLongPress: () => _confirmDelete(context, index),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.call),
                        ),
                        title: Text(
                          names[index],
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        subtitle: Text(numbers[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
