import 'package:flutter/material.dart';

class AddRoom extends StatefulWidget {
  AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _images = [
    "https://th.bing.com/th/id/OIP.iSu2RcCcdm78xbxNDJMJSgHaEo?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.5Nocx_3QA8ZVkMfKA-2XbwHaE8?w=263&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7"
  ];
  late String _streetName;
  late int _price;
  late int _size;
  late bool _isFixedPrice;
  late String _contact;
  late String _description;
  bool _internet = false;
  bool _water = false;
  bool _parking = false;
  bool _kitchen = false;
  bool _bed = false;
  bool _electricity = false;

  void _addImage(String image) {
    setState(() {
      _images.add(image);
    });
  }

  void _removeImage(String image) {
    setState(() {
      _images.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.network(_images[index]),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _removeImage(_images[index]),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextButton(
                  child: Text(
                    "Add Image",
                  ),
                  onPressed: () => _images,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
