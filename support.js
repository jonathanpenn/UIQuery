// Supporting the test environment

function log() {
  var text = Array.prototype.join.call(arguments, ', ');
  UIALogger.logMessage(text);
}

function test(description, steps) {
  try {
    UIALogger.logStart(description);
    steps();
    UIALogger.logPass(description);
  }
  catch(err) {
    if (err.message) {
      var where = "raised on line " + err.line +
        " in file " + err.sourceURL;
      UIALogger.logError(err.message);
      UIALogger.logError(where);
    } else {
      UIALogger.logError(err);
    }

    UIALogger.logFail(description);
  }
}
