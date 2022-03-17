import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator? = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_add_8_to_2_equals_10() {
        //given
        sut = Operator.add
        
        //when
        let result = sut?.calculate(lhs: 3.0, rhs: 5.0)
        
        //then
        XCTAssertEqual(result, 8.0)
    }
    
    func test_subtract_7_from_10_equals_3() {
        //given
        sut = Operator.subtract
        
        //when
        let result = sut?.calculate(lhs: 10.0, rhs: 7.0)
        
        //then
        XCTAssertEqual(result, 3.0)
    }

    func test_divide_81_by_9_equals_9() {
        //given
        sut = Operator.divide
        
        //when
        let result = sut?.calculate(lhs: 81.0, rhs: 9.0)
        
        //then
        XCTAssertEqual(result, 9.0)
    }
    
    func test_multiply_4_by_6_equals_24() {
        //given
        sut = Operator.multiply
        
        //when
        let result = sut?.calculate(lhs: 4.0, rhs: 6.0)
        
        //then
        XCTAssertEqual(result, 24.0)
    }
}
