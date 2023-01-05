import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewCredits extends StatelessWidget {
  const ViewCredits({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Crediti"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text("Formattazione file domande:",
                              style: TextStyle(fontSize: 18)),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _launchInBrowser(
                                        "https://github.com/Mikyll");
                                  },
                                  child: const Text("Mikyll",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                                const Text(" &",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _launchInBrowser(
                                        "https://github.com/TryKatChup");
                                  },
                                  child: const Text("TryKatChup",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                                const Text(" &",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                _launchInBrowser("https://github.com/Noesh");
                              },
                              child: const Text("Noesh",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
