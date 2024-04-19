import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactForm extends StatelessWidget {
  TextEditingController messagecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  
  
  GlobalKey contactkey = GlobalKey<FormState>();

 Future<void> send(BuildContext context) async {
  final Email email = Email(
    body: messagecontroller.text,
    recipients: [emailcontroller.text='hello@senrama.com'],
  );

  try {
    await FlutterEmailSender.send(email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email sent successfully')),
    );
  } catch (error) {
    print('Error sending email: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to send email')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Form(
        key: contactkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16.0),
                TextField(
                
                
                decoration: const InputDecoration(
                  labelText: 'Email',
                  
                ),
                controller: emailcontroller
              ),
              const SizedBox(height: 16.0),
               TextField(
                
                decoration: const InputDecoration(
                  labelText: 'Message',
                ),
                maxLines: 4,
                controller: messagecontroller,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Implement form submission logic
                  await send(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
