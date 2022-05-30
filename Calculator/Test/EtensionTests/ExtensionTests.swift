import XCTest
@testable import Calculator

class ExtensionTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ""
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_split_x로구분이되는지() {
        // given
        let target: Character = "x"
        let string = "abcxdef"
        let expectation = ["abc", "x", "def"]
        
        // when
        let result = string.split(with: target)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split_더하기로구분했을때_배열이일치하는지() {
        // given
        let target: Character = "+"
        let string = "1+242+43+2"
        let expectation = ["1", "+", "242", "+", "43", "+", "2"]
        
        // when
        let result = string.split(with: target)
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_split_target이끝에있을때_끝에빈문자열이안들어가는지() {
        // given
        let target: Character = "y"
        let string = "aybycdy"
        let expectation = ["a", "y", "b", "y", "cd", "y"]
        
        // when
        let result = string.split(with: target)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split_빈문자열을넣었을때_빈문자열을반환하는지() {
        // given
        let target: Character = "x"
        let string = ""
        let expectation = [""]
        
        // when
        let result = string.split(with: target)
        
        // then
        XCTAssertEqual(result, expectation)
    }
}
