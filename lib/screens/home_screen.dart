import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  var _gender = 'male';
  var _newsletter = false;
  var _driver = false;
  var _marry = false;
  var _child = false;
  var _age = 0.0;
  var _channel = 'Facebook';
  var _email = '';
  final _fkey = GlobalKey<FormState>();

  final _channels = ['Facebook', 'Twitter', 'Instagram', 'Line'].map((e) {
    return DropdownMenuItem(
      child: Text(e),
      value: e,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ลงทะเบียน')),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              buildTextField(),
              buildRadio(),
              buildCheckbox(),
              buildSwitch(),
              buildSlider(),
              buildDropdown(),
              buildForm(),
              ElevatedButton(
                  onPressed: () {
                    _fkey.currentState?.save();
                    _fkey.currentState?.validate();

                    print(
                        'Name ${_nameController.text} ${_surnameController.text}');
                    print('Gender $_gender ');
                    print('Newsletter $_newsletter ');
                    print('Drive $_driver ');
                    print('Marry $_marry ');
                    print('Child $_child ');
                    print('Age $_age ');
                    print('Channel $_channel ');
                    print('Email $_email ');
                  },
                  child: Text('บันทึก')),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() => Form(
        key: _fkey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'อีเมล'),
              maxLength: 50,
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => _email = value ?? '',
            ),
          ],
        ),
      );

  Widget buildDropdown() => DropdownButton(
        value: _channel,
        items: _channels,
        onChanged: (value) => setState(() => _channel = value.toString()),
      );

  Widget buildSlider() => Slider(
        label: _age.round().toString(),
        value: _age,
        min: 0.0,
        max: 100.0,
        divisions: 100,
        onChanged: (value) => setState(() => _age = value),
      );

  Widget buildSwitch() => Column(
        children: [
          SwitchListTile(
            title: Text('แต่งงาน'),
            value: _marry,
            onChanged: (value) => setState(() => _marry = value),
          ),
          SwitchListTile(
            title: Text('มีบุตร'),
            value: _child,
            onChanged: (value) => setState(() => _child = value),
          )
        ],
      );

  Widget buildCheckbox() => Column(
        children: [
          CheckboxListTile(
            title: Text('สม้ครรับจดหมายข่าว'),
            value: _newsletter,
            onChanged: (value) => setState(() => _newsletter = value ?? false),
          ),
          CheckboxListTile(
            title: Text('ใบขับขี่รถยนต์'),
            value: _driver,
            onChanged: (value) => setState(() => _driver = value ?? false),
          ),
        ],
      );

  Widget buildRadio() => Column(
        children: [
          RadioListTile(
              title: const Text('ชาย'),
              value: 'male',
              groupValue: _gender,
              onChanged: (value) => setState(() => _gender = value.toString())),
          RadioListTile(
              title: const Text('หญิง'),
              value: 'female',
              groupValue: _gender,
              onChanged: (value) => setState(() => _gender = value.toString())),
        ],
      );

  Widget buildTextField() => Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'ชื่อ'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: _nameController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'นามสกุล'),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: _surnameController,
          ),
        ],
      );
}
