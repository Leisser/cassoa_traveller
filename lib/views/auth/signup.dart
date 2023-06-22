import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? password;
  String? firstName;
  String? lastName;
  String? otherName;
  String? address;
  String? phoneNumber;
  String? email;
  String? passportNumber;
  String? nationalIdentificationNumber;
  DateTime? dateOfBirth;
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  otherName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Other Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  passportNumber = value;
                });
              },
              decoration: InputDecoration(labelText: 'Passport Number'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  nationalIdentificationNumber = value;
                });
              },
              decoration: InputDecoration(labelText: 'National Identification Number'),
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    setState(() {
                      dateOfBirth = selectedDate;
                    });
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  dateOfBirth != null
                      ? 'Date of Birth: ${dateOfBirth!.toLocal()}'.split(' ')[0]
                      : 'Select Date of Birth',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showCountryPicker(
  context: context,
  countryListTheme: CountryListThemeData(
    flagSize: 25,
    backgroundColor: Colors.white,
    textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
    bottomSheetHeight: 500, // Optional. Country list modal height
    //Optional. Sets the border radius for the bottomsheet.
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
    //Optional. Styles the search field.
    inputDecoration: InputDecoration(
      labelText: 'Search',
      hintText: 'Start typing to search',
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xFF8C98A8).withOpacity(0.2),
        ),
      ),
    ),
  ),
  onSelect: (Country country) => print('Select country: ${country.displayName}'),
);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    selectedCountry != null
                        ? selectedCountry.flagEmoji.
                        : SizedBox.shrink(),
                    SizedBox(width: 8.0),
                    Text(
                      selectedCountry != null ? selectedCountry!.name : 'Select Country',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: () {
                // Perform registration logic here
                // Access the entered values using the respective variables
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

