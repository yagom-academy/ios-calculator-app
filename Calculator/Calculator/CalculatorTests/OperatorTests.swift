import XCTest
@testable import Calculator
class OperatorTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_add_결과값이_올바른가() {
        //given
        let add = Operator.add
        
        //when
        let result = add.calculate(lhs: 3, rhs: 3)
        
        //then
        XCTAssertEqual(result, 6)
    }

}
