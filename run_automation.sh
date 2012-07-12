set -e

BUILD_DIR=/tmp/UIQueryTest

mkdir -p $BUILD_DIR

xcodebuild -sdk iphonesimulator build CONFIGURATION_BUILD_DIR=$BUILD_DIR

rm -rf automation_results
mkdir -p automation_results

./unix_instruments \
  -D automation_results/trace \
  -t UIAutomationTemplate.tracetemplate \
  $BUILD_DIR/UIQueryTest.app \
  -e UIARESULTSPATH automation_results \
  -e UIASCRIPT test.js

echo "Tests complete!"

