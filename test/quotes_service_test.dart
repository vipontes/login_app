import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/services/quotes_service.dart';
import 'package:login_app/model/token.dart';

void main() {
  final QuotesApiService svc = QuotesApiService();

  test('Testa o endpoint de login', () async {
    expect(await svc.login("", "", ""), isInstanceOf<Token>());
  });
}
