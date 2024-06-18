import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrasructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf/api');

    /*Guarda el mapa de los datos de la respuesta(json) Map<String, dynamic>*/
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    /*Genera la identidad a raiz del mapa */
    return yesNoModel.toMessageEntity();
  }
}
