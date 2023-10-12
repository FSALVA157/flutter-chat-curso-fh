import 'package:flutter/material.dart';

class MessageInputBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageInputBox({Key? key, required this.onValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    //controler del textformfield
    final inputTextController = TextEditingController();
    //control de foco de textformfield pero podria usarse para otro elemento tambien
    final focusNodeInstance = FocusNode();

    final inputDecoration = InputDecoration(
        filled: true,
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        hintText: 'Type a message finalized with ?',
        suffixIcon: IconButton(
          onPressed: (){            
            final value = inputTextController.value.text;
            inputTextController.clear();
            onValue(value);
          },
          icon: const Icon(Icons.send_outlined)
          )
          );

    return TextFormField(
      onTapOutside: (event) {
        focusNodeInstance.unfocus();
      },
      focusNode: focusNodeInstance,
      controller: inputTextController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {        
        inputTextController.clear();
        //linea que mantiene el foco en el input text
        focusNodeInstance.requestFocus();
        onValue(value);
      }      
    );
  }
}
