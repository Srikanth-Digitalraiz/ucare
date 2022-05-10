import 'package:country_calling_code_picker/picker.dart';

class CountryPciker {
  Future countryCodePicker(context) async {
    final country = await showCountryPickerSheet(
      context,
    );

    return country;
  }
}
