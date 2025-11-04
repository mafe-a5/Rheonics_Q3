import 'package:flutter/material.dart';
import 'ui/colors.dart';
import 'ui/styles.dart';
import 'ui/constants.dart';
import 'ui/widgets.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CommunicationScreen(),
  ));
}

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          "Communication",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: const CommunicationForm(),
    );
  }
}

class CommunicationForm extends StatefulWidget {
  const CommunicationForm({super.key});

  @override
  State<CommunicationForm> createState() => _CommunicationFormState();
}

class _CommunicationFormState extends State<CommunicationForm> {
  final macController = TextEditingController();
  final etherMacController = TextEditingController();
  final ipController = TextEditingController();
  final subnetController = TextEditingController();
  final gatewayController = TextEditingController();
  final dnsController = TextEditingController();
  final portController = TextEditingController();

  bool dhcpEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          appCard(title: "Bluetooth LTE 4.0", children: [
            appRowField("MAC", appInput(controller: macController, enabled: !dhcpEnabled)),
          ]),

          const SizedBox(height: 20),

          appCard(title: "Ethernet", children: [
            appRowField("Ethernet MAC", appInput(controller: etherMacController, enabled: !dhcpEnabled)),

            appRowField(
              "DHCP",
              appDropdown(
                ["Enabled", "Disabled"],
                value: dhcpEnabled ? "Enabled" : "Disabled",
                onChanged: (v) {
                  setState(() {
                    dhcpEnabled = v == "Enabled";
                  });
                },
              ),
            ),

            appRowField("IP", appInput(controller: ipController, enabled: !dhcpEnabled)),
            appRowField("Subnet", appInput(controller: subnetController, enabled: !dhcpEnabled)),
            appRowField("Gateway IP", appInput(controller: gatewayController, enabled: !dhcpEnabled)),
            appRowField("DNS", appInput(controller: dnsController, enabled: !dhcpEnabled)),
            appRowField("Terminal Port", appInput(controller: portController, enabled: !dhcpEnabled)),

            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    debugPrint("Saved!");
                  },
                  child: const Text("Update",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}