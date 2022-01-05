import 'package:amosportfolio/utils/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class MyCV extends StatefulWidget {
  const MyCV({Key? key}) : super(key: key);

  @override
  _MyCVState createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {

  static const int _initialPage = 1;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfController _pdfController;


  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('pdfs/amoscv.pdf'),
      initialPage: _initialPage,
      viewportFraction: 1.5
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context,listen: false);

    return Card(
      elevation: 5,
      color: Colors.black87,
      child: Stack(
        children: [
          PdfView(
              documentLoader: const Center(child: CircularProgressIndicator()),
              pageLoader: const Center(child: CircularProgressIndicator()),
              controller: _pdfController,
              onDocumentLoaded: (document) {
                setState(() {
                  _allPagesCount = document.pagesCount;
                });
              },
              onPageChanged: (page) {
                setState(() {
                  _actualPageNumber = page;
                });
              },
          ),

          Positioned(
            top: 0,
              left: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.cancel,color: Colors.red,),
                    onPressed: () {
                      navigationProvider.setDisplayed(0);
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.navigate_before,color: Colors.white,),
                    onPressed: () {
                      _pdfController.previousPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 100),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$_actualPageNumber/$_allPagesCount',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.navigate_next,color: Colors.white),
                    onPressed: () {
                      _pdfController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 100),
                      );
                    },
                  ),
                ],
              )
          ),

          Positioned(
            top: 0,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh,color: Colors.white,),
                    onPressed: () {
                      if (isSampleDoc) {
                        _pdfController.loadDocument(
                            PdfDocument.openAsset('pdfs/amoscv.pdf'));
                      } else {
                        _pdfController.loadDocument(
                            PdfDocument.openAsset('pdfs/amoscv.pdf'));
                      }
                      isSampleDoc = !isSampleDoc;
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.file_download,color: Colors.white,),
                    onPressed: () {
                      const url = "assets/pdfs/amoscv.pdf";
                      html.AnchorElement anchorElement =  html.AnchorElement(href: url);
                      anchorElement.download = "AmosCV";
                      anchorElement.click();
                    },
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
