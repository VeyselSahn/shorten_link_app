import 'package:flutter_test/flutter_test.dart';
import 'package:grisoft/core/service/shorten_service.dart';

void main() {
  test("api", () async {
    var response = await ShortenService().shortenLink("grisoft.com");
    expect(response, isNotNull);
  });
}
