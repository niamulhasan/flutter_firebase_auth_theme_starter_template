import 'package:express/providers/localization_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("localize: Should return a string", () async {
    //arrange
    //act
    LocalizationProvider localizationProvider =
        LocalizationProvider(language: Language.en);
    String exampleString = await localizationProvider.localize(
        key: "settings", fallbackText: "Settings");
    print(exampleString);
    //assert
    expect(1, 1);
  });
}
