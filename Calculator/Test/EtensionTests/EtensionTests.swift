import XCTest
@testable import Calculator

class EtensionTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_split(with target: Character)
    func test_Target을_기준으로_문자열을_나눌_수_있는지() {
        // given
        let str = "문자열나누기테스트"
        // when
        let result = str.split(with: "누")
        // then
        XCTAssertEqual(result, ["문자열나","기테스트"])
    }
    
    func test_문자열에_없는_target으로_나누면_원래_문자열의_배열이_반환되는지() {
        // given
        let str = "문자열나누기테스트"
        // when
        let result = str.split(with: "눈")
        // then
        XCTAssertEqual(result, ["문자열나누기테스트"])
    }
}
