import 'package:delivering_app/widgets/LoginForm.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty email returns error string', () {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });
}
