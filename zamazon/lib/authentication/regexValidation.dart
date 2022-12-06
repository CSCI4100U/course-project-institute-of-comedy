class RegexValidation {
  String? validateEmail(String? value) {
    RegExp regExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)');
    if (value == null || value.isEmpty) {
      return 'Please enter a Email';
    } else if (!regExp.hasMatch(value)) {
      return 'Email example: abc@gmail.com';
    }
    return null;
  }

  String? validatePassword(String? value) {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
    if (value == null || value.isEmpty) {
      return 'Please enter a Password';
    } else if (!regExp.hasMatch(value)) {
      return 'At least 6 letters, 1 uppercase, 1 lowercase, and 1 number';
    }
    return null;
  }

  //Used for name, country, province, and city. only requirement is no nums
  //so I just used a switch for the different outputs.
  String? validateNoNums(String field, String? value) {
    RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');

    switch (field) {
      case 'name':
        if (value == null || value.isEmpty) {
          return 'Please enter a Name';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid name (No numbers)';
        }
        return null;
      case 'country':
        if (value == null || value.isEmpty) {
          return 'Please enter a Country';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid Country name (No numbers)';
        }
        return null;
      case 'province':
        if (value == null || value.isEmpty) {
          return 'Please enter a Province';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid Province name (No numbers)';
        }
        return null;
      case 'city':
        if (value == null || value.isEmpty) {
          return 'Please enter a City';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid City name (No numbers)';
        }
        return null;
    }
  }

  String? validatePostal(String? value) {
    RegExp regExp = RegExp(r'^[A-Z][0-9][A-Z]\s[0-9][A-Z][0-9]$');
    if (value == null || value.isEmpty) {
      return 'Please enter a Postal Code';
    } else if (!regExp.hasMatch(value)) {
      return 'Postal Code Example: A1A 1A1';
    }
    return null;
  }

  String? validateStreetAddress(String? value) {
    RegExp regExp = RegExp(r'^[0-9]+ [0-9 a-z A-Z.-]+$');
    if (value == null || value.isEmpty) {
      return 'Please enter a Street Address';
    } else if (!regExp.hasMatch(value)) {
      return 'Street Address Example: 301 Front St W';
    }
    return null;
  }
}
