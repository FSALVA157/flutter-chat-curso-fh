enum FromWho { me, hers }


class Message{
  final String message;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.message, 
    this.imageUrl, 
    required this.fromWho});


}