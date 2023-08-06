import 'package:flutter/material.dart';

class GoldCardTile extends StatefulWidget {
  const GoldCardTile({Key? key}) : super(key: key);

  @override
  State<GoldCardTile> createState() => _GoldCardTileState();
}

class _GoldCardTileState extends State<GoldCardTile>
    with TickerProviderStateMixin {
  bool _isTapped = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(197, 162, 101, 1),
              Color.fromARGB(146, 119, 72, 1)
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gold Card'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      _isTapped
                          ? Image.asset('assets/images/home/Guarantee.png')
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _isTapped
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toady\'s Gold Rate'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Rs 5.5245/gm + GST',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available Gold'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '5.5245/gm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isTapped
                          ? SizedBox(
                              height: 35,
                              width: 155,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.indigo[900]),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Buy Jewelry'.toUpperCase(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 35,
                              width: 155,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.indigo[900]),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Deliver Gold'.toUpperCase(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                      _isTapped
                          ? SizedBox(
                              height: 35,
                              width: 155,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Buy Gold'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 35,
                              width: 155,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Sell Gold'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 60,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isTapped = !_isTapped;
                  });
                },
                child: Container(
                  width: 30,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(40, 40),
                      bottomLeft: Radius.elliptical(40, 40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 15,
                        height: 3,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 20,
                        height: 3,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 15,
                        height: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
