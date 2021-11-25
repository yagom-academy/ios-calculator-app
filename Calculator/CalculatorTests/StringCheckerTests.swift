//import XCTest
//
//@testable import Calculator
//
//class StringCheckerTests: XCTestCase {
//    var testCases: [String] = []
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        
//        testCases.append("+ 123 + 123 + 123 +")
//        testCases.append("* 12 + / 123 - -")
//        testCases.append("")
//        testCases.append("1")
//        testCases.append("1 / 3")
//        testCases.append("123z")
//    }
//
//    func test_hasNotAbnormalCharacter() {
//        let answerList = [ true,
//                           true,
//                           true,
//                           true,
//                           true,
//                           false ]
//        
//        for index in 0..<testCases.count {
//            XCTAssertEqual(ExpressionParser.StringChecker.hasOnlyValidCharacter(from: testCases[index]), answerList[index], "test: \(index) was failed")
//        }
//    }
//    
//    func test_firstOrLastComponentIsNotOperand() {
//        
//        let newTestCases: [[String]] = testCases.map {
//            return $0.split(with: " ")
//        }
//        
//        let answerList = [ false,
//                           false,
//                           false,
//                           true,
//                           true,
//                           false ]
//        
//        for index in 0..<newTestCases.count {
//            XCTAssertEqual(ExpressionParser.StringChecker.firstAndLastComponentAreOperands(from: newTestCases[index]), answerList[index], "test: \(index) was failed")
//        }
//    }
//    
//}
