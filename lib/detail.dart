import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController textarea = TextEditingController();
  String videoName = "Unggah Video";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cucian'),
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
                    backgroundColor: Color(0xFF3282B8),
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
              const Text("Deskripsi Tambahan"),
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
                    backgroundColor: Color(0xFF3282B8),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Tambahkan Informasi"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
