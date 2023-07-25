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
              TextFormField(
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
                    if (textarea.value.text == "" &&
                        videoName == "Unggah Video") {
                      showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Terjadi Kesalahan'),
                              content: const Text(
                                'Mohon tambahkan minimal salah satu dari rekaman atau deskripsi.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Mengerti'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      Navigator.pop(context);

                      final snackBar = SnackBar(
                        content:
                            const Text('Informasi cucian berhasil ditambahkan'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
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
