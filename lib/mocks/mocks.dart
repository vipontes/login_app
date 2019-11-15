import 'package:http/http.dart' as http;
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:mockito/mockito.dart';

class QuoteClient extends Mock implements http.Client {}

class QuoteApiService extends Mock implements IQuotesApi {}
