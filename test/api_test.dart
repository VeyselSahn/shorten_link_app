import 'package:flutter_test/flutter_test.dart';
import 'package:grisoft/core/service/shorten_service.dart';


void main() {
  test("api", () async {
    final _service = ShortenService();
    var _res = await _service.shortenLink('grisoftbilisim.com.tr');
    expect(_res, isNotNull);
  });
}
