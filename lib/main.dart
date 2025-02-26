import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  int? adultAllowance;
  int? childAllowance;
  Map<String, int> order = <String, int>{};

  var adultButtonLabels = [
    "Hot Meal",
    "Soup",
    "Ham Sandwich",
    "Turkey Sandwich",
    "Roast Beef Sandwich",
    "Cheese Sandwich",
    "PBJ Sandwich",
  ];

  var childButtonLabels = [
    "Hot Meal",
    "Ham Sandwich",
    "Turkey Sandwich",
    "Roast Beef Sandwich",
    "Cheese Sandwich",
    "PBJ Sandwich",
  ];

  final TextEditingController _scanTextFieldController = TextEditingController();

  final TextEditingController _notesTextFieldController = TextEditingController();

  var purchaseCompletedSnackBar = SnackBar(
    content: Text('Purchase completed'),
    duration: const Duration(seconds: 1),
  );

  var commmonBoxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 3.0,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );

  var commonTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

  var commonBlackTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
  
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
                        scanGuestIdBox(),
                        if (adultAllowance != null && childAllowance != null) allowanceBox(),
                      ],
                    )
                  ),
                  Flexible( // TOP RIGHT REGION
                    flex: 3,
                    child: Column(
                      children: [
                        if (adultAllowance != null && childAllowance != null) notesBox(),
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
                  orderButtonBox("Adult", adultButtonLabels),
                  orderButtonBox("Child", childButtonLabels),
                  orderSummaryBox(context),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Flexible notesBox() {
    return Flexible( // NOTES
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
    );
  }

  Flexible allowanceBox() {
    var allowancesTextStyle = TextStyle(
      fontWeight: FontWeight.bold, 
      fontSize: 20,
      color: Theme.of(context).primaryColor,
    );

    return Flexible(
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
    );
  }

  Flexible scanGuestIdBox() {
    return Flexible(  // TOP LEFT TOP: SCAN
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
    );
  }

  Flexible orderSummaryBox(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        decoration: commmonBoxDecoration,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row( // BUTTONS
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible( // PURCHASE BUTTON
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
                  Flexible( // CANCEL BUTTON
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
            Flexible(  // ORDER SUMMARY LIST
              flex: 5,
              child: ListView(
                children: <Widget>[
                  for (var entry in order.entries) ListTile(
                    title: Text('${entry.value}  ${entry.key}'), 
                    trailing: IconButton(icon: Icon(Icons.delete), 
                      onPressed: () => {
                        setState(() { deleteItem(entry.key);})
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }

  Flexible orderButtonBox(String widgetLabel, List<String> buttonLabels) {
    return Flexible(
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
                    widgetLabel,
                  ),
                )
              ),
              for (var buttonLabel in buttonLabels) Flexible(
                flex: 1, 
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        addItem("$buttonLabel - $widgetLabel");
                      })
                    }, 
                    child: Text(style: commonTextStyle, "$buttonLabel - $widgetLabel"),
                  ),
                )
              ),
            ],
          ),
        )
      )
    );
  }
}