import XCTest

@testable import Calculator

class StringTests: XCTestCase {
    
    var testCases: [String] = []

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        testCases.append("+123+123+123+")
        testCases.append("*12+/123--")
        testCases.append("")
        testCases.append("1")
        testCases.append("1/3")
        testCases.append("123z")
    }
    
    func test_splitting() {
        let answerList = [ ["123","123","123"],
                           ["*12","/123--"],
                           [],
                           ["1"],
                           ["1/3"],
                           ["123z"] ]
        
        for index in 0..<testCases.count {
            XCTAssertEqual(testCases[index].split(with: "+"), answerList[index], "test: \(index) was failed")
        }
    }

    func test_hasOnlyNumberOrOperator() {
        let answerList = [ true,
                           true,
                           true,
                           true,
                           true,
                           false ]
        
        for index in 0..<testCases.count {
            XCTAssertEqual(testCases[index].hasOnlyNumberOrOperator(), answerList[index], "test: \(index) was failed")
        }
    }
    
    func test_firstAndLastLetterAreNumbers() {
        let answerList = [ false,
                           false,
                           false,
                           true,
                           true,
                           false ]
        
        for index in 0..<testCases.count {
            XCTAssertEqual(testCases[index].firstAndLastLetterAreNumbers(), answerList[index], "test: \(index) was failed")
        }
    }
    
}
