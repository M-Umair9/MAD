import 'package:flutter/material.dart';

class AddAdminForm extends StatefulWidget {
  @override
  _AddAdminFormState createState() => _AddAdminFormState();
}

class _AddAdminFormState extends State<AddAdminForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _E_MailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  // Add controllers for other input fields as needed

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _E_MailController.dispose();
    _PasswordController.dispose();
    // Dispose other controllers if used
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform necessary actions here
      String name = _nameController.text;
      String phone = _phoneController.text;
      String email = _E_MailController.text;
      String password= _PasswordController.text;
      // Access values of other input fields as needed
      print('Name: $name');
      print('Phone: $phone');
      print('E_mail: $email');
      print('Password: $password');
      // Perform further actions or data submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Admin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _E_MailController,
                decoration: InputDecoration(labelText: 'E_mail'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return'please Enter Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _PasswordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
              // Add more TextFormField widgets for other input fields
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add New Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
