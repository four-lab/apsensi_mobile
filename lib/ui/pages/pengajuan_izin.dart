import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:apsensi_mobile/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PengajuanIzinPage extends StatefulWidget {
  const PengajuanIzinPage({Key? key}) : super(key: key);

  @override
  State<PengajuanIzinPage> createState() => _PengajuanIzinPageState();
}

class _PengajuanIzinPageState extends State<PengajuanIzinPage> {
  String? _selectedItem;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  String? pdfPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: transparentBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Pengajuan Izin',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 12,
        ),
        children: [
          pengajuanForm(),
        ],
      ),
    );
  }

  Widget pengajuanForm() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jenis Izin'),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: buttonDisableColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              hint: Text('Pilih Jenis Izin'),
              padding: EdgeInsets.only(left: 10),
              isExpanded: true,
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items: <String>[
                'Dinas Keluar Kota',
                'Sakit',
                'Kepentingan Keluarga',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 8),
          Text('Deskripsi'),
          SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Masukkan Deskripsi",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tanggal Izin'),
                    SizedBox(height: 8),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Pilih Tanggal",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jumlah Hari'),
                    SizedBox(height: 8),
                    TextField(
                      controller: daysController,
                      decoration: InputDecoration(
                        hintText: "Jumlah Hari",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.all(10),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Lampiran'),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: TextButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  setState(() {
                    pdfPath = result.files.single.path;
                  });
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black, width: 0.4),
                ),
              ),
              child: pdfPath == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/perizinan/pdfIcon.png',
                          width: 48,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hanya file dengan format PDF',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : PDFView(
                      filePath: pdfPath,
                      fitPolicy: FitPolicy.BOTH,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: false,
                      pageSnap: true,
                      defaultPage: 0,
                      onRender: (_pages) {
                        setState(() {});
                      },
                      onError: (error) {
                        print(error.toString());
                      },
                      onPageError: (page, error) {
                        print('$page: ${error.toString()}');
                      },
                      onViewCreated: (PDFViewController pdfViewController) {},
                    ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Fungsi yang akan dijalankan saat tombol ditekan
              },
              child: Text('Ajukan'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: buttonActiveColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
