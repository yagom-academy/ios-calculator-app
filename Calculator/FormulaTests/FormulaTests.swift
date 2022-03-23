import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula? = nil
    
    func test_add_12_and_23_equals_25() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: 12.0)
        sut?.operands.enqueue(element: 23.0)
        sut?.operators.enqueue(element: "+")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result, 35.0)
    }
    
    func test_add_minus_10_and_15_equals_5() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: -10.0)
        sut?.operands.enqueue(element: 15.0)
        sut?.operators.enqueue(element: "+")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result, 5.0)
    }
    
    func test_divide_81_by_minus_9_equals_minus_9() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: 81.0)
        sut?.operands.enqueue(element: -9.0)
        sut?.operators.enqueue(element: "/")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result, -9.0)
    }
    
    func test_multiply_4_by_6_equals_24() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: 4.0)
        sut?.operands.enqueue(element: 6.0)
        sut?.operators.enqueue(element: "*")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result, 24.0)
    }
    
    func test_multiply_plus_divide_formula() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: 4.0)
        sut?.operands.enqueue(element: 6.0)
        sut?.operands.enqueue(element: 10.0)
        sut?.operands.enqueue(element: 5.0)
        sut?.operators.enqueue(element: "*")
        sut?.operators.enqueue(element: "+")
        sut?.operators.enqueue(element: "/")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result, 6.8)
        
    }
    
    func test_divide_any_number_by_0_equals_nan() {
        //given
        sut = Formula()
        sut?.operands.enqueue(element: 14.0)
        sut?.operands.enqueue(element: 0.0)
        sut?.operators.enqueue(element: "/")
        
        //when
        guard let result: Double = try? sut?.result() else { return }
        
        //then
        XCTAssertEqual(result.isNaN, true)
    }
    
}
