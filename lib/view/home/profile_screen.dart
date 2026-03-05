import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/profile_viewmodel.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileViewModel>().loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.user == null) {
      return const Center(child: Text('Profile not available'));
    }

    final user = vm.user!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.image),
          ),
          const SizedBox(height: 12),
          Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),


          _section(
            title: 'Personal Information',
            children: [
              _row('Age', user.age.toString()),
              _row('Gender', user.gender),
              _row('Birth Date', user.birthDate),
              _row('Blood Group', user.bloodGroup),
            ],
          ),

          _section(
            title: 'Contact',
            children: [
              _row('Phone', user.phone),
              _row('Email', user.email),
            ],
          ),

          _section(
            title: 'Education',
            children: [
              _row('University', user.university),
            ],
          ),


          _section(
            title: 'Account',
            children: [
              _row('Role', user.role),
            ],
          ),
        ],
      ),
    );
  }



  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
