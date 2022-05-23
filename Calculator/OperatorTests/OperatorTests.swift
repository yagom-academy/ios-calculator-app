import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add_3과5를넣으면_8이나오는지() {
        // given
        let lhs: Double = 3
        let rhs: Double = 5
        let expectition: Double = 8
       
        
        // when
        sut = .add
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectition)
    }

    func test_subtract_3과5를넣으면_음수2가나오는지() {
        // given
        let lhs: Double = 3
        let rhs: Double = 5
        let expectition: Double = -2
       
        
        // when
        sut = .subtract
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectition)
    }
    
    func test_divide_8과4를넣으면_2가나오는지() {
        // given
        let lhs: Double = 8
        let rhs: Double = 4
        let expectition: Double = 2
       
        
        // when
        sut = .divide
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectition)
    }
    
    func test_multiply_3과5를넣으면_15가나오는지() {
        // given
        let lhs: Double = 3
        let rhs: Double = 5
        let expectition: Double = 15
       
        
        // when
        sut = .multiply
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectition)
    }
    
    func test_divide_0으로나눴을때_0이나오고오류가출력되는지() {
        // given
        let lhs: Double = 5
        let rhs: Double = 0
       
        // when
        sut = .divide
        let nanError = sut.calculate(lhs: lhs, rhs: rhs)
        let result = nanError.isNaN
        
        // then
        XCTAssertTrue(result)
    }
}
