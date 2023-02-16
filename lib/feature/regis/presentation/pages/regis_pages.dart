import 'package:flutter/material.dart';

import '../../widget/textformfield_regis.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _activeStepIndex = 0;

  List<Step> stepList() {
    return [
      Step(
        title: _activeStepIndex != 0
            ? const Text('')
            : const Text(
                'ข้อมูลส่วนตัว        ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Column(
          children: [
            TextFormFieldRegis(
              labelText: "ชื่อ - นามสกุล",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              labelText: "ชื่อเล่น",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              labelText: "เพศ",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              labelText: "อีเมลล์",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldRegis(
              labelText: "เบอร์โทร",
              keyboardType: TextInputType.name,
            ),
          ],
        ),
        isActive: _activeStepIndex == 0,

      ),
      Step(
        title: _activeStepIndex != 1
            ? const Text('')
            : const Text(
                'ทักษะ     ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        content: Text('2'),
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
        content: Text('5'),
        isActive: _activeStepIndex == 4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ลงทะเบียน',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: kToolbarHeight + 16,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              value: (_activeStepIndex + 1) / stepList().length,
            ),
          ),
          Expanded(
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
                } else {
                  // navigate to previous page
                }
              },
              steps: stepList(),
              controlsBuilder:
                  (BuildContext context, ControlsDetails controlsDetails) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: _activeStepIndex < stepList().length - 1,
                      child: ElevatedButton(
                        onPressed: controlsDetails.onStepContinue,
                        child: Text('ต่อไป'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
