import XCTest

@testable import Calculator

class StringTests: XCTestCase {

    func test_splitting() {
        let testString = "+123+123+123+"
        
        XCTAssertEqual(testString.split(with: "+"), ["123","123","123"])
    }

    func test_hasOnlyNumberOrOperator() {
        let testString1 = "*12+/123--"
        let testString2 = ""
        let testString3 = "1"
        
        let result = testString1.hasOnlyNumberOrOperator()
                        && testString2.hasOnlyNumberOrOperator()
                        && testString3.hasOnlyNumberOrOperator()
        
        XCTAssertEqual(result, true)
    }
    
    func test_firstAndLastLetterAreNumbers() {
        let testString1 = "1"
        let testString2 = "1/3"
        let testString3 = "123"
        
        let result = testString1.firstAndLastLetterAreNumbers()
                        && testString2.firstAndLastLetterAreNumbers()
                        && testString3.firstAndLastLetterAreNumbers()
        
        XCTAssertEqual(result, true)
    }
    
}
