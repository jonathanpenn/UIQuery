UIQuery
=======

UIQuery is an experiment to make it easy to find elements anywhere and at any
depth in the view heirarchy.

The basic method, `matchIn(...)`, takes an element to search below and a
function that gets called for each subelement below to the full depth. If you
return true from that function, then that element is returned by the
`matchIn(...)` method.  This returns null if no element is found.

`firstWithName(...)` is an example using this. It looks for any element with
the given name in the window, or in a specific element context if it is handed
in as the second parameter.

To match with the existing automation APIs, I have `firstWithName(...)` return
a `UIAElementNil` if `matchIn(...)` doesn't find anything. That way you can use
the `.isValid()` query methods on the result of this search.

Check out `test.js` as an example of how to use it.


## To Run The Tests

Simply cd into the project directory and type `./run_automation.sh`. That will
trigger a compile and execute Instruments so you can see the tests execute
against the sample application.

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


## Concerns with this approach:

1. Since UIQuery sets the timeout to 0 so that the searching happens quickly,
   you have to delay the script manually to wait for animations or views to
   appear on screen. This could be solved with a timeout in these searching
   methods, but I'm holding off on that complexity for now.

2. There's no way to instantiate a `UIAElementNil`, so I'm generating one by
   trying to fetch a non-existant element by name on the target. I don't know
   what kind of long term effects that might have.


## License

Copyright (c) 2012 Jonathan Penn (<http://cocoamanifest.net>)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
