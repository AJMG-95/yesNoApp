/*Modelo para mapear la raspuesta de la api*/
/*
  El objetivo de los modelos no es más que tener todas las propiedades
  de las respuestas de la api, es crear una adaptacion especifica de las
  respuestas de la api
*/

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';
import 'package:yes_no_app/domain/entities/message.dart';

/*Esto es por si la response de la api viniera en forma de string, lo pasa a mapa: */
  YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));

/*Esto transforma la instacia del modelo a string (util para post y put http):*/
  String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

/* Constructor para definir la estructura de las instancias de las respuesta de la api*/
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });


  /*Mapea el json de la respuesta para crear/devolver la instancia de la respuesta de la api */
  /* Al crear una instancia se considera un factory constructor */
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  /*Usa la instancia para generar un mapa/json */
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  /*Va a regresar un mensaje(message):  */
  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.other,
    imageUrl: image,
  );
}
