import 'package:flutter/material.dart';
import '../models/show.dart';
import '../theme/app_colors.dart';

class PaymentPopup extends StatefulWidget {
  final Show show;

  const PaymentPopup({
    super.key,
    required this.show,
  });

  @override
  State<PaymentPopup> createState() => _PaymentPopupState();
}

class _PaymentPopupState extends State<PaymentPopup> {
  final _formKey = GlobalKey<FormState>();

  bool acceptPolicies = false;
  bool receiveNotifications = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.card,
      title: const Text(
        'Buy Ticket',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),

                const Text(
                  'Ticket Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  color: AppColors.background,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          widget.show.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Date: ${widget.show.date.month}/${widget.show.date.day}/${widget.show.date.year}',
                        ),

                        Text('Time: ${widget.show.time}'),

                        const SizedBox(height: 10),

                        Text(
                          'Total: \$${widget.show.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                CheckboxListTile(
                  title: const Text(
                    'I accept the ticket policies',
                  ),
                  value: acceptPolicies,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      acceptPolicies = value ?? false;
                    });
                  },
                ),

                CheckboxListTile(
                  title: const Text(
                    'I want to receive notifications about upcoming shows',
                  ),
                  value: receiveNotifications,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      receiveNotifications = value ?? false;
                    });
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            final messenger = ScaffoldMessenger.of(context);

            if (!acceptPolicies) {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('Please accept the ticket policies'),
                ),
              );
              return;
            }

            Navigator.pop(context);

            messenger.showSnackBar(
              const SnackBar(
                content: Text('Demo purchase confirmed! No payment was processed.'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: const Text('Confirm Buy'),
        ),
      ],
    );
  }
}