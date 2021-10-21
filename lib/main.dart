import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TextField",
      home: TextFieldExamble(),
    );
  }
}

class TextFieldExamble extends StatefulWidget {
  const TextFieldExamble({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TextFieldExamble();
}

class _TextFieldExamble extends State<TextFieldExamble> {
  Widget _buildNumberTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline4,
      decoration: const InputDecoration(
          icon: Icon(Icons.attach_money),
          labelText: "Enter an Integer: ",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onSubmitted: (value) {
        if (value.isEmpty) {
          ErrorDescription("message");
          print("ERROR:........");
        } else {
          Fluttertoast.showToast(
              msg: "You enter: $value",
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.yellow,
              webBgColor: "linear-gradient(to right, #00b09b, #96c93d)");
        }
      },
    );
  }

  final _controller = TextEditingController();
  Widget _buildMutilineTextField() {
    return TextField(
      controller: _controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counterText: "${_controller.text.split(" ").length} words ",
          labelText: "Enter mulitiline text",
          hintText: "....",
          border: const OutlineInputBorder()),
      onChanged: (txt) => setState(() {}),
    );
  }

  bool _showPassword = false;
  Widget _buildPassWordTextField() {
    return TextField(
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.security),
        suffixIcon: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          color: _showPassword ? Colors.blue : Colors.green,
          onPressed: () => setState(() {
            _showPassword = !_showPassword;
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          const ListTile(
            title: Text("1. Number input field"),
          ),
          _buildNumberTextField(),
          const ListTile(
            title: Text("2. Multiline input field"),
          ),
          _buildMutilineTextField(),
          const ListTile(
            title: Text("3. PassWord input field"),
          ),
          _buildPassWordTextField(),
          const ListTile(
            title: Text("4. Borderless input field"),
          )
        ],
      ),
    );
  }
}
