#import "support.js"
#import "uiquery.js"

test("Finds first element with a specific name", function() {
  var elm = UIQuery.firstWithName("Row 1");
  if (!elm.isValid()) throw "Element wasn't found";
});

test("Returns invalid element if nothing found", function() {
  var elm = UIQuery.firstWithName("This Shouldn't Be On Screen");
  if (elm.isValid()) throw "Whoops! An element was found.";
});

test("Tap through to see static text on next screen", function() {
  var elm = UIQuery.firstWithName("Row 1");
  elm.tap();

  UIATarget.localTarget().delay(2);

  var staticText = UIQuery.firstWithName("Row 1");

  if (!staticText.isValid()) throw "No element with that name was found";
  if (!(staticText instanceof UIAStaticText)) {
    throw "What came back wasn't a static text!";
  }
});
