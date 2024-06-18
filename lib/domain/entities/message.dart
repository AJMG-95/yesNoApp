enum FromWho { me, other }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'] ?? '',
      imageUrl: json['image'],
      fromWho: json['from'] == 'me' ? FromWho.me : FromWho.other,
    );
  }
}
