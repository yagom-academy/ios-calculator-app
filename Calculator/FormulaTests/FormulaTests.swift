import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula? = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_add_12_and_23_equals_25() {
        sut = Formula()
        
        sut?.operands.enqueue(element: 12.0)
        sut?.operands.enqueue(element: 23.0)
        sut?.operators.enqueue(element: "+")
        
        guard let result: Double = sut?.result() else { return }
        
        XCTAssertEqual(result, 35.0)
    }
    
    func test_add_minus_10_and_15_equals_5() {
        sut = Formula()
        
        sut?.operands.enqueue(element: -10.0)
        sut?.operands.enqueue(element: 15.0)
        sut?.operators.enqueue(element: "+")
        
        guard let result: Double = sut?.result() else { return }
        
        XCTAssertEqual(result, 5.0)
    }
    
    func test_divide_81_by_minus_9_equals_minus_9() {
        sut = Formula()
        
        sut?.operands.enqueue(element: 81.0)
        sut?.operands.enqueue(element: -9.0)
        sut?.operators.enqueue(element: "/")
        
        guard let result: Double = sut?.result() else { return }
        
        XCTAssertEqual(result, -9.0)
    }
    
    func test_multiply_4_by_6_equals_24() {
        sut = Formula()
        
        sut?.operands.enqueue(element: 4.0)
        sut?.operands.enqueue(element: 6.0)
        sut?.operators.enqueue(element: "*")
        
        guard let result: Double = sut?.result() else { return }
        
        XCTAssertEqual(result, 24.0)
    }

    func test_multiply_plus_divide_formula() {
        sut = Formula()
        
        sut?.operands.enqueue(element: 4.0)
        sut?.operands.enqueue(element: 6.0)
        sut?.operands.enqueue(element: 10.0)
        sut?.operands.enqueue(element: 5.0)
        sut?.operators.enqueue(element: "*")
        sut?.operators.enqueue(element: "+")
        sut?.operators.enqueue(element: "/")
        
        guard let result: Double = sut?.result() else { return }
        
        XCTAssertEqual(result, 6.8)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
