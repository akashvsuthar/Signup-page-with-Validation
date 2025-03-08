import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/SIGNUP%20PAGE%20WITH%20VALIDATION/AppTypography.dart';
import 'package:my_note/SIGNUP%20PAGE%20WITH%20VALIDATION/home_page.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _birthdate = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  @override
  void dispose() {
    _birthdate.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      setState(() {
        _birthdate.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  //select Region
  String? _selectedRegion;
  final List<String> _regions = [
    'India',
    'America',
    'France',
    'Italy',
    'Japan',
    'Mexico'
  ];

  //gender
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _gender.text = '';
  }

  // show password
  bool pwdvisibility = false;
  bool passvisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.yellow.shade200,
            Colors.yellow.shade200,
            Colors.white
          ],
          begin: Alignment.topCenter, // Start the gradient at top-right
          end: Alignment.bottomCenter, // End the gradient at bottom-left
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Create Your Account",
                        style: AppTypography.txt20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Email address",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.email_outlined,
                            size: 18,
                          ),
                        )),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Full Name",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.person_2_outlined,
                            size: 18,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Please enter a valid name (letters and spaces only)';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _birthdate,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Date of Birth",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 18,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Birthdate';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.yellow.shade50,
                    borderRadius: BorderRadius.circular(25),
                    value: _selectedRegion,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Region",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 18,
                          ),
                        )),
                    items: _regions.map((region) {
                      return DropdownMenuItem(
                        value: region,
                        child: Text(
                          region,
                          style: AppTypography.txt12,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRegion = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a region';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _mobileNumber,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Mobile Number",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.call_outlined,
                            size: 18,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      final regex = RegExp(r'^[0-9]{10}$');
                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid 10-digit mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      controller: _password,
                      obscureText: !passvisibility,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "password",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.lock_outline,
                            size: 18,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () => setState(
                              () => passvisibility = !passvisibility,
                            ),
                            child: Icon(
                              passvisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 8) {
                          return 'Password should be at least 8 spacial(@,#,etc..) characters';
                        }
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        }
                        return null;
                      }),
                  SizedBox(height: 12),
                  TextFormField(
                      controller: _confirmpassword,
                      obscureText: !pwdvisibility,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Confirm password",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.lock_outline,
                            size: 18,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () => setState(
                              () => pwdvisibility = !pwdvisibility,
                            ),
                            child: Icon(
                              pwdvisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _gender,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.yellow.shade50,
                        filled: true,
                        hintText: "Gender",
                        hintStyle: AppTypography.txt12,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.group_outlined,
                            size: 18,
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter gender';
                      }
                      if (value != 'Male' && value != 'Female') {
                        return 'Please enter either "Male" or "Female"';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      // Male radio button
                      Radio<String>(
                        fillColor: WidgetStatePropertyAll(Colors.black),
                        activeColor: Colors.black,
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value; // Update selected gender
                            _gender.text = value!; // Update the TextField text
                          });
                        },
                      ),
                      Text('Male', style: AppTypography.txt12),
                      SizedBox(
                        width: 50,
                      ),
                      Radio<String>(
                        fillColor: WidgetStatePropertyAll(Colors.black),
                        activeColor: Colors.black,
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value; // Update selected gender
                            _gender.text = value!; // Update the TextField text
                          });
                        },
                      ),
                      Text('Female', style: AppTypography.txt12),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          elevation: WidgetStatePropertyAll(0),
                          fixedSize: WidgetStatePropertyAll(Size(325, 45)),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.yellow.shade600)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => home_page(),
                          ));
                        }
                      },
                      child: Text("Signup", style: AppTypography.txt15))
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
