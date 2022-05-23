import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result_1더하기2곱하기3빼기4는5가나오는지() {
        // given
        let expectation: Double = 5
        
        // when
        sut.operands.enqueue(1)
        sut.operators.enqueue(.add)
        sut.operands.enqueue(2)
        sut.operators.enqueue(.multiply)
        sut.operands.enqueue(3)
        sut.operators.enqueue(.subtract)
        sut.operands.enqueue(4)
        let result = try? sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result_비어있는formula면에러를보내는지() {
        // when
        let result = try? sut.result()
        
        // then
        XCTAssertNil(result)
    }
}
