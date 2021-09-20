import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangetiile;
  final ValueChanged<String> onChangeDesc;
  final VoidCallback onSavedTodo;

  const MyWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.onChangetiile,
      required this.onChangeDesc,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            buildDesc(),
            SizedBox(
              height: 10,
            ),
            buildButton(),
          ],
        ),
      );
  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangetiile,
        validator: (title) {
          if (title!.isEmpty) {
            return "Can't be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Add Title",
          labelText: "Title",
          border: UnderlineInputBorder(),
        ),
      );
  Widget buildDesc() => TextFormField(
        maxLines: 5,
        onChanged: onChangeDesc,
        initialValue: description,
        validator: (description) {
          if (description!.isEmpty) {
            return "Description Can't be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Add Description",
          labelText: "Description",
          border: UnderlineInputBorder(),
        ),
      );

  Widget buildButton() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onSavedTodo, child: Text("Save")));
}
