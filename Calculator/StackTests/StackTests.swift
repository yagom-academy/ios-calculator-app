import XCTest
@testable import Calculator

class StackTests: XCTestCase {
    private var sut: Stack<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Stack<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty_stack이비어있을때_True를반환하는지() {
        // When
        let result = sut.isEmpty()
        
        // Then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_0과1을추가하면_stack에0과1이들어가는지() {
        // Given
        let firstInput: Double = 0
        let secondInput: Double = 1
        let expectation: [Double] = [0, 1]
        
        // When
        sut.enqueue(firstInput)
        sut.enqueue(secondInput)
        let result = sut.stack
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_연속으로dequeue하면_뒤에서두번째요소가반환되는지() {
        // Given
        let currentStack: [Double] = [1, 2]
        let expectation: Double = 1
        
        // When
        sut.stack = currentStack
        var result = sut.dequeue()
        result = sut.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
