import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrasructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    /* Peticion http(get) mediante dio */
    final response = await _dio.get('http://yesno.wtf/api');

    /*Genera la instancia de la respuesta usando el factory del modelo*/
    final yesNoModel = YesNoModel.fromJson(response.data);

    /*Genera entidad usando la instancia que ha generado el modelo */
    return yesNoModel.toMessageEntity();
  }
}
