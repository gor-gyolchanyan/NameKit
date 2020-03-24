import XCTest

import NameKit_Test

var testCaseEntrySet: [XCTestCaseEntry] {
    var result = [XCTestCaseEntry]()
    result.append(contentsOf: NameKit_Test.testCaseEntrySet)
    return result
}

XCTMain(testCaseEntrySet)
