import 'package:session_3/features/accounts/data/models/agify_response_model.dart';
import 'package:dio/dio.dart';

class CreditRemoteDataSource {
  static const agifyApiUrl = 'https://api.agify.io';

  final dio = Dio();

  Future<AgifyResponseModel> getCreditScore({required String userName}) async {
    final url = '$agifyApiUrl?name=$userName';
    // Para la librería HTTP se necesita el URI, mientras que para Dio se puede usar directamente el String
    // final uri = Uri.parse('$agifyApiUrl?name=$userName');

    final response = await dio.get(url);

    return AgifyResponseModel.fromJson(response.data);
  }
}
