import 'package:flutter/material.dart';
import 'package:test_app/features/calculator/widgets/calculator_input_field.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _key = GlobalKey<FormState>();
  final value1Controller = TextEditingController();
  final value2Controller = TextEditingController();

  @override
  void dispose() {
    value1Controller.dispose();
    value2Controller.dispose();
    super.dispose();
  }

  void _showResuldDialog(int result) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(result.toString()),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [_buildCalculatorForm()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_key.currentState?.validate() ?? false) {
            final result = int.parse(value1Controller.text) +
                int.parse(value2Controller.text);
            _showResuldDialog(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCalculatorForm() {
    return Form(
      key: _key,
      child: Column(
        children: [
          CalculatorInputField(
            textLable: 'Value 1',
            controller: value1Controller,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          CalculatorInputField(
            textLable: 'Value 2',
            controller: value2Controller,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
