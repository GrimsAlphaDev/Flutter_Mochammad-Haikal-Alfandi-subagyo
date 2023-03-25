import 'package:app_section_17_assets/Galeri/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GaleriPage extends StatefulWidget {
  const GaleriPage({super.key});

  @override
  State<GaleriPage> createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Meta Quest VR Headset'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Perhatian'),
                                  content: Column(
                                    children: [
                                      const Text('Apakah Anda Yakin ?'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image_(1).png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      /// This parameter indicates this action is the default,
                                      /// and turns the action's text to bold text.
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    CupertinoDialogAction(
                                      /// This parameter indicates the action would perform
                                      /// a destructive action such as deletion, and turns
                                      /// the action's text color to red.
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            // Karena Passing Argument Maka Lebih Mudah Menggunakan MaterialPageRoute Dibanding Menggunakan NamedRoute
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailPage(
                                                      image:
                                                          'assets/image_(1).png',
                                                    )));
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image_(1).png'),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 157, 157),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image_(1).png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Projector Pocked 4K'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Perhatian'),
                                  content: Column(
                                    children: [
                                      const Text('Apakah Anda Yakin ?'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image_(4).jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      /// This parameter indicates this action is the default,
                                      /// and turns the action's text to bold text.
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    CupertinoDialogAction(
                                      /// This parameter indicates the action would perform
                                      /// a destructive action such as deletion, and turns
                                      /// the action's text color to red.
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            // Karena Passing Argument Maka Lebih Mudah Menggunakan MaterialPageRoute Dibanding Menggunakan NamedRoute
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailPage(
                                                      image:
                                                          'assets/image_(4).jpg',
                                                    )));
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image_(4).jpg'),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 157, 157),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image_(4).jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Diji 4K Drone'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Perhatian'),
                                  content: Column(
                                    children: [
                                      const Text('Apakah Anda Yakin ?'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image_(5).jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      /// This parameter indicates this action is the default,
                                      /// and turns the action's text to bold text.
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    CupertinoDialogAction(
                                      /// This parameter indicates the action would perform
                                      /// a destructive action such as deletion, and turns
                                      /// the action's text color to red.
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            // Karena Passing Argument Maka Lebih Mudah Menggunakan MaterialPageRoute Dibanding Menggunakan NamedRoute
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailPage(
                                                      image:
                                                          'assets/image_(5).jpg',
                                                    )));
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image_(5).jpg'),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 157, 157),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image_(5).jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('360 Camera Insta 360'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Perhatian'),
                                  content: Column(
                                    children: [
                                      const Text('Apakah Anda Yakin ?'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image_(6).jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      /// This parameter indicates this action is the default,
                                      /// and turns the action's text to bold text.
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    CupertinoDialogAction(
                                      /// This parameter indicates the action would perform
                                      /// a destructive action such as deletion, and turns
                                      /// the action's text color to red.
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            // Karena Passing Argument Maka Lebih Mudah Menggunakan MaterialPageRoute Dibanding Menggunakan NamedRoute
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailPage(
                                                      image:
                                                          'assets/image_(6).jpg',
                                                    )));
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image_(6).jpg'),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 157, 157),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image_(6).jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Meta Quest Pro 2 VR'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Perhatian'),
                                  content: Column(
                                    children: [
                                      const Text('Apakah Anda Yakin ?'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/image_(7).jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      /// This parameter indicates this action is the default,
                                      /// and turns the action's text to bold text.
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    CupertinoDialogAction(
                                      /// This parameter indicates the action would perform
                                      /// a destructive action such as deletion, and turns
                                      /// the action's text color to red.
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            // Karena Passing Argument Maka Lebih Mudah Menggunakan MaterialPageRoute Dibanding Menggunakan NamedRoute
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DetailPage(
                                                      image:
                                                          'assets/image_(7).jpg',
                                                    )));
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/image_(7).jpg'),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 163, 157, 157),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image_(7).jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
