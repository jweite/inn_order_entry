import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBI Order Entry',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Order Entry'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  final ColorScheme colorScheme = theme.colorScheme;

    var commmonBoxDecoration = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 3.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    );
    
    var commonTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    var commonBlackTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
    
    var allowancesTextStyle = TextStyle(
      fontWeight: FontWeight.bold, 
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: commmonBoxDecoration,
                            margin: EdgeInsets.all(5),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Scan Guest Barcode',
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),                            ),
                          )
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            constraints: BoxConstraints.expand(),
                            decoration: commmonBoxDecoration,
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                            margin: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  style: commonTextStyle,
                                  "Allowance",
                                ),
                                Center(
                                  child: Text(
                                    style: allowancesTextStyle,
                                    "1 Adult",
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    style: allowancesTextStyle,
                                    "3 Children",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            constraints: BoxConstraints.expand(),
                            decoration: commmonBoxDecoration,
                            margin: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Notes',
                                ), 
                                expands: true,
                                maxLines: null,
                              ),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: commmonBoxDecoration,
                      margin: EdgeInsets.all(10),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  style: commonTextStyle,
                                  "Adult"
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Hot Meal"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Soup"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Ham Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Turkey Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Roast Beef Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Cheese Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "PBJ Sandwich"),
                                ),
                              )
                            ),
                           ],
                        ),
                      )
                    )
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: commmonBoxDecoration,
                      margin: EdgeInsets.all(10),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  style: commonTextStyle,
                                  "Children"
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Hot Meal"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Ham Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Turkey Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Roast Beef Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "Cheese Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {}, 
                                  child: Text(style: commonTextStyle, "PBJ Sandwich"),
                                ),
                              )
                            ),
                           ],
                        ),
                      )
                    )
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: commmonBoxDecoration,
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: ElevatedButton(
                                      onPressed: () => {}, 
                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                                      child: Text(style: commonBlackTextStyle, "Purchase"),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () => {}, 
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey)),
                                    child: Text(style: commonBlackTextStyle, "Cancel"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Placeholder(),
                          )
                        ],
                      )
                    )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );

  }

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             const Column(
//               children: [

//               ],
//             )
            
            
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
}