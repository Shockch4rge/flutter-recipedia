import 'package:flutter/material.dart';
import 'package:flutter_recipedia/main.dart';
import 'package:flutter_recipedia/models/user.dart';
import 'package:flutter_recipedia/utils/get_args.dart';
import 'package:flutter_recipedia/widgets/appbars/personal_profile_settings_app_bar.dart';
import 'package:flutter_recipedia/widgets/common/avatar.dart';

class PersonalProfileSettingsScreen extends StatefulWidget {
  static const routeName = "/home/profile/me/settings";

  const PersonalProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalProfileSettingsScreen> createState() =>
      _PersonalProfileSettingsScreenState();
}

class _PersonalProfileSettingsScreenState
    extends State<PersonalProfileSettingsScreen> {
  User get user => getArgs<User>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PersonalProfileSettingsAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Avatar(
              size: 84,
              avatarUrl: user.avatarUrl,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              child: const Text(
                "Change profile photo",
                style: TextStyle(fontSize: 14, color: App.primaryAccent),
              ),
            ),
            const SizedBox(height: 10),
            PersonalProfileSettingsForm(user: user),
          ],
        ),
      ),
    );
  }
}

class PersonalProfileSettingsForm extends StatefulWidget {
  final User user;

  const PersonalProfileSettingsForm({Key? key, required this.user})
      : super(key: key);

  @override
  State<PersonalProfileSettingsForm> createState() =>
      _PersonalProfileSettingsFormState();
}

class _PersonalProfileSettingsFormState
    extends State<PersonalProfileSettingsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value! == widget.user.username) {
                return "You can't have the same username as the previous one.";
              }

              return null;
            },
            initialValue: widget.user.username,
            decoration: const InputDecoration(
              label: Text("Username"),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value! == widget.user.name) {
                return "You can't have the same name as the previous one.";
              }

              return null;
            },
            initialValue: widget.user.name,
            decoration: InputDecoration(
              label: Text("Name"),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: Size.infinite.width,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: App.primaryAccent,
              ),
              child: Text("Save Changes"),
            ),
          )
        ],
      ),
    );
  }
}