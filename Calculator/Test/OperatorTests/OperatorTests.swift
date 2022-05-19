import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    // MARK: Setting
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: Test_add(lhs: Double, rhs: Double)
    func testOperator의_add함수_실행시_더한_값이_잘_반환되는지() {
        // given
        let operatorSymbols = Operator.add
        // when
        let result = operatorSymbols.add(lhs: 1, rhs: 2)
        // then
        XCTAssertEqual(result,3)
    }
}
