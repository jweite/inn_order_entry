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

  final TextEditingController _scanTextFieldController = TextEditingController();
  final TextEditingController _notesTextFieldController = TextEditingController();
  int? adultAllowance;
  int? childAllowance;
  var purchaseCompletedSnackBar = SnackBar(
    content: Text('Purchase completed'),
    duration: const Duration(seconds: 1),
  );

  Map<String, int> order = <String, int>{};

  void addItem(String item) {
    if (order.containsKey(item)) {
      order[item] = (order[item]! + 1);
    }
    else {
      order[item] = 1;
    }
  }

  void deleteItem(String item) {
    order.remove(item);
  }

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
              child: Row( // TOP ROW
                children: [
                  Flexible( // TOP LEFT REGION
                    flex: 1,
                    child: Column(
                      children: [
                        Flexible(  // TOP LEFT TOP: SCAN
                          flex: 1,
                          child: Container(
                            decoration: commmonBoxDecoration,
                            margin: EdgeInsets.all(5),
                            child: TextField(
                              controller: _scanTextFieldController,
                              decoration: InputDecoration(
                                hintText: 'Scan Guest Barcode',
                                prefixIcon: IconButton(
                                  onPressed: () => (),
                                  icon: Icon(Icons.person)
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () => {
                                    _scanTextFieldController.text = "12345",
                                    _notesTextFieldController.text = "Guest card expiring 6/1/25",
                                    setState(() {
                                      adultAllowance = 1; 
                                      childAllowance = 3;
                                    })
                                  },
                                  icon: Icon(Icons.check_circle)
                                ),
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
                        if (adultAllowance != null && childAllowance != null) Flexible( // TOP LEFT BOTTOM: ALLOWANCE
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
                                    (adultAllowance != null) ? "$adultAllowance Adult" : "",
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    style: allowancesTextStyle,
                                    (childAllowance != null) ? "$childAllowance Child" : "",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Flexible( // TOP RIGHT REGION
                    flex: 3,
                    child: Column(
                      children: [
                        if (adultAllowance != null && childAllowance != null) Flexible( // NOTES
                          flex: 1,
                          child: Container(
                            constraints: BoxConstraints.expand(),
                            decoration: commmonBoxDecoration,
                            margin: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                controller: _notesTextFieldController,
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
            if (adultAllowance != null && childAllowance != null) Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible( // BOTTOM LEFT: ADULT ORDER BUTTONS
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
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Hot Meal - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Hot Meal"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Soup - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Soup"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Ham Sandwich - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Ham Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Turkey Sandwich - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Turkey Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Roast Beef Sandwich - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Roast Beef Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Cheese Sandwich - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Cheese Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("PBJ Sandwich - Adult");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "PBJ Sandwich"),
                                ),
                              )
                            ),
                           ],
                        ),
                      )
                    )
                  ),
                  Flexible( // BOTTOM MIDDLE: CHILD ORDER BUTTONS
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
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Hot Meal - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Hot Meal"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Ham Sandwich - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Ham Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Turkey Sandwich - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Turkey Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Roast Beef Sandwich - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Roast Beef Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("Cheese Sandwich - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "Cheese Sandwich"),
                                ),
                              )
                            ),
                            Flexible(
                              flex: 1, 
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    setState(() {
                                      addItem("PBJ Sandwich - Child");
                                    })
                                  }, 
                                  child: Text(style: commonTextStyle, "PBJ Sandwich"),
                                ),
                              )
                            ),
                           ],
                        ),
                      )
                    )
                  ),
                  Flexible( // BOTTOM RIGHT: ORDER SUMMARY
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
                                      onPressed: () => {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          purchaseCompletedSnackBar
                                        ),
                                        Future.delayed(const Duration(seconds: 1), () {
                                          _notesTextFieldController.text = "";
                                          _scanTextFieldController.text = "";
                                          setState(() {
                                            adultAllowance = null;
                                            childAllowance = null;
                                            order.clear();
                                          });
                                        })
                                      }, 
                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                                      child: Text(style: commonBlackTextStyle, "Purchase"),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                        _notesTextFieldController.text = "",
                                        _scanTextFieldController.text = "",
                                        setState(() {
                                          adultAllowance = null;
                                          childAllowance = null;
                                          order.clear();
                                        })
                                    }, 
                                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey)),
                                    child: Text(style: commonBlackTextStyle, "Cancel"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: ListView(
                              children: <Widget>[
                                for (var entry in order.entries) ListTile(title: Text('${entry.value}  ${entry.key}'), trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => {setState(() { deleteItem(entry.key);})},),),
                              ],
                            ),
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