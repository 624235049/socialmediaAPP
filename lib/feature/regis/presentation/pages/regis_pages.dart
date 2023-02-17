import 'package:flutter/material.dart';
import 'package:mfecinternship/feature/regis/widget/widget_text.dart';
import 'package:mfecinternship/utils/theme.dart';

import '../../widget/widget_textformfield.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _activeStepIndex = 0;
  String _selectedGender = '';
  String _selectedLocation = 'Mobile Developper';
  DateTime? _selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameSurname = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController expect = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    nameSurname.dispose();
    nickName.dispose();
    birthday.dispose();
    email.dispose();
    phone.dispose();
    skill.dispose();
    expect.dispose();
    super.dispose();
  }

  List<Step> stepList() {
    return [
      Step(
        title: _activeStepIndex != 0
            ? const Text('')
            : const Text(
                'ข้อมูลส่วนตัว        ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        //Form Step 1 personal information
        content: formContentPersonal(),
        isActive: _activeStepIndex == 0,
      ),
      Step(
        title: _activeStepIndex != 1
            ? const Text('')
            : const Text(
                'ทักษะ     ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              textController: skill,
              labelText: "ทักษะที่มี",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30),
              child: DropdownButtonFormField(
                value: _selectedLocation,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ต้องการฝึกงานตำแห่น่งใด',
                  ),
                  items: <String>[
                    'Mobile Developper',
                    'Fontend Developper',
                    'Backend Developper',
                    'DevOps'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              textController: expect,
              labelText: "สิ่งที่คาดหวังจากการฝึกงาน",
              keyboardType: TextInputType.text,
            ),

          ],
        ),
        isActive: _activeStepIndex == 1,
      ),
      Step(
        title: _activeStepIndex != 2
            ? const Text('')
            : const Text(
                'อัปโหลดรูปโปรไฟล์   ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: const Text('3'),
        isActive: _activeStepIndex == 2,
      ),
      Step(
        title: _activeStepIndex != 3
            ? const Text('')
            : const Text(
                'ตั้งค่ารหัสผ่าน    ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: const Text('4'),
        isActive: _activeStepIndex == 3,
      ),
      Step(
        title: _activeStepIndex != 4
            ? const Text('')
            : const Text(
                'เงื่อนไขและข้อตกลง',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: const Text('5'),
        isActive: _activeStepIndex == 4,
      ),
    ];
  }

  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information  //Form Step 1 personal information
  //=========================================================================================================================================================================
  //=========================================================================================================================================================================
  Widget formContentPersonal() {
    return Column(
      children: [
        TextFormFieldRegis(
          textController: nameSurname,
          labelText: "ชื่อ - นามสกุล",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: nickName,
          labelText: "ชื่อเล่น",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),

        //select radio Gender
        selectedGender(),
        const SizedBox(
          height: 20,
        ),

        //select calendar
        birthDayFormField(),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: email,
          labelText: "อีเมลล์",
          keyboardType: TextInputType.name,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormFieldRegis(
          textController: phone,
          labelText: "เบอร์โทร",
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }

  //Gender Widget
  Widget selectedGender() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'เพศ',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 'ชาย',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              const Text('ชาย'),
              Radio(
                value: 'หญิง',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              const Text('หญิง'),
              Radio(
                value: 'อื่นๆ',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value.toString();
                  });
                },
              ),
              Text('อื่นๆ'),
            ],
          ),
        ),
      ),
    );
  }

  //Calender Widget
  Widget birthDayFormField() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'วันเกิด',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today,
                color: AppTheme.buttonBackgroundColor),
            onPressed: () {
              selectDate(context);
            },
          ),
        ),
        controller: dateController,
        readOnly: true,
      ),
    );
  }

  //select Calender dd/mm/yyyy
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate!,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateController.text =
            '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}';
      });
    }
  }

  //Form Step 1 personal information //Form Step 1 personal information //Form Step 1 personal information
  //=========================================================================================================================================================================
  //=========================================================================================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  BigText(text: "ลงทะเบียน"),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: (_activeStepIndex + 1) / stepList().length,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: AppTheme.buttonBackgroundColor,
                  onSurface: Colors.black, // set the inactive color
                ),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _activeStepIndex,
                onStepTapped: (index) {
                  setState(() {
                    _activeStepIndex = index;
                  });
                },
                onStepContinue: () {
                  if (_activeStepIndex < stepList().length - 1) {
                    setState(() {
                      _activeStepIndex++;
                    });
                  } else {
                    // navigate to next page
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex > 0) {
                    setState(() {
                      _activeStepIndex--;
                    });
                  } else {}
                },
                steps: stepList(),
                controlsBuilder:
                    (BuildContext context, ControlsDetails controlsDetails) {
                  return Theme(
                    data: ThemeData(
                      colorScheme: const ColorScheme.light(
                        primary: AppTheme.buttonBackgroundColor,
                        // กำหนดสีไอคอนเมื่อเลือก (active)
                        onSurface: Colors
                            .black, // กำหนดสีไอคอนเมื่อไม่ได้เลือก (inactive)
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: _activeStepIndex > 0,
                          child: ElevatedButton(
                            onPressed: controlsDetails.onStepCancel,
                            child: Text('ย้อนกลับ'),
                          ),
                        ),
                        Visibility(
                          visible: _activeStepIndex < stepList().length - 1,
                          child: ElevatedButton(
                            onPressed: controlsDetails.onStepContinue,
                            child: Text('ต่อไป'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
