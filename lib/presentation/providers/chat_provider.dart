
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
 
 final ScrollController scrollController = ScrollController();

 final List<Message> messagesList = [];

 final GetYesNoAnswer getYesNoAnswer =  GetYesNoAnswer();

 void herReply() async{
      final herRes = await getYesNoAnswer.getAnswer();
      print(herRes);
      messagesList.add(herRes);
      moveScrollToBottom();
      notifyListeners();
 }


  Future<void> sendMessage(String texto)async{
    if(texto.isEmpty) return;
    if(texto.endsWith("?")){
        herReply();
    }
    final new_message = Message(message: texto, fromWho: FromWho.me);
    messagesList.add(new_message);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );
  }

}