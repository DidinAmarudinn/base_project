import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:logger/logger.dart';

class ApiClient {
  final http.Client httpClient;
  ApiClient({required this.httpClient});
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  RetryClient retryClient() {
    final client = RetryClient(
      httpClient,
      retries: 3,
      when: (response) {
        logger.v("${response.request?.url}");
        logger.v("${response.request?.headers}");
        return response.statusCode == 401 ? true : false;
      },
      onRetry: (req, res, retryCount) {
        if (retryCount == 0 && res?.statusCode == 401) {
          // refresh token
        }
      },
    );
    return client;
  }
}
