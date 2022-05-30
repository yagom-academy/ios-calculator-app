import XCTest
@testable import Calculator

class KeypadTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_convertNumber(_ index: Int)
    func test_키패드_숫자를_문자로_변환해주는지1() {
        // given
        let index = 10
        // when
        let result = Keypad.convertNumber(index)
        // then
        XCTAssertEqual(result,"00")
    }
    
    func test_키패드_숫자를_문자로_변환해주는지2() {
        // given
        let index = 0
        // when
        let result = Keypad.convertNumber(index)
        // then
        XCTAssertEqual(result,"0")
    }
}
