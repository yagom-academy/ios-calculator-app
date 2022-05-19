import XCTest
@testable import Calculator

class StringSplitTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ""
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_split_x로구분하면첫번째요소가맞게나오는지() {
        // given
        let target: Character = "x"
        let string = "abcxdef"
        let expectation = "abc"
        
        // when
        let stringArray = string.split(with: target)
        let result = stringArray[0]
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split_y로구분했을때_배열의count일치하는지() {
        // given
        let target: Character = "y"
        let string = "aybycxdeyf"
        let expectation = 4
        
        // when
        let stringArray = string.split(with: target)
        let result = stringArray.count
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_split_target이끝에있을때_끝에빈문자열이안들어가는지() {
        // given
        let target: Character = "y"
        let string = "aybycdy"
        let expectation = ["a", "b", "cd"]
        
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


