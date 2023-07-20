import 'package:bersihin_app/chat.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController textarea = TextEditingController();
  String videoName = "Unggah Video";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Komplain'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Rekaman Cucian"),
              const SizedBox(height: 20),
              SizedBox(
                height: 30.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 14),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () async {
                    var picked = await FilePicker.platform
                        .pickFiles(type: FileType.video);

                    if (picked != null) {
                      setState(() {
                        videoName = picked.files.first.name;
                      });
                    }
                  },
                  child: Text(videoName),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Keterangan"),
              const SizedBox(height: 20),
              TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ),
                    );
                  },
                  child: const Text("Ajukan Komplain"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
