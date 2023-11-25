import 'package:dio/dio.dart';
import 'package:yes_no_flutter/domain/entities/message.dart';
import 'package:yes_no_flutter/infrastructure/models/yes_no_models.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
