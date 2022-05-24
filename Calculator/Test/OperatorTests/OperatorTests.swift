import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
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
        let result = try? operatorSymbols.calculate(lhs: 1, rhs: 2)
        // then
        XCTAssertEqual(result,3)
    }
    
    // MARK: Test_subtract(lhs: Double, rhs: Double)
    func testOperator의_subtract함수_실행시_뺀_값이_잘_반환되는지() {
        // given
        let operatorSymbols = Operator.subtract
        // when
        let result = try? operatorSymbols.calculate(lhs: 4, rhs: 2)
        // then
        XCTAssertEqual(result,2)
    }
    
    // MARK: Test_divide(lhs: Double, rhs: Double)
    func testOperator의_divide함수_실행시_나눈_값이_잘_반환되는지() {
        // given
        let operatorSymbols = Operator.divide
        // when
        let result = try? operatorSymbols.calculate(lhs: 4, rhs: 2)
        // then
        XCTAssertEqual(result,2)
    }
    
    func test_0으로_나눴을_때_에러가_반환되는지() {
        // given
        let operatorSymbols = Operator.divide
        // when
        // then
        XCTAssertThrowsError(try operatorSymbols.calculate(lhs: 0, rhs: 2))
    }
    
    // MARK: multiply(lhs: Double, rhs: Double)
    func testOperator의_multiply함수_실행시_곱한_값이_잘_반환되는지() {
        // given
        let operatorSymbols = Operator.multiply
        // when
        let result = try? operatorSymbols.calculate(lhs: 4, rhs: 2)
        // then
        XCTAssertEqual(result,8)
    }
}
