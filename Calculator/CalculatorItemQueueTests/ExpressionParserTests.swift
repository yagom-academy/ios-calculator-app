import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

extension ExpressionParserTests {
    func test_String_split() {
        let input = "1+2+3"
        let result = input.split(with: "+")
        XCTAssertEqual(result, ["1", "+", "2", "+", "3"])
    }
    
    func test_String_split_분리할_필요가_없을때() {
        let input = "123"
        let result = input.split(with: "+")
        XCTAssertEqual(result, ["123"])
    }
    
    func test_String_split_빈_문자열이_포함되는지() {
        let input = "12+2++3"
        let result = input.split(with: "+")
        XCTAssertEqual(result, ["12", "+", "2", "+", "", "+", "3"])
    }
}
