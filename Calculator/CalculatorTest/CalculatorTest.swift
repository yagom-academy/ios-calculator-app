import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue_0을추가하면_배열에0이들어가는지() {
        // Given
        let input = 0
        let expectation = [0]
        
        // When
        sut.enqueue(element: input)
        let result = sut.queue
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_0과1을추가하면_0과1이들어간배열로변경하는지() {
        // Given
        let firstInput = 0
        let secondInput = 1
        let expectation = [0, 1]
        
        // When
        sut.enqueue(element: firstInput)
        sut.enqueue(element: secondInput)
        let result = sut.queue
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_queue가3일때_3을반환하는지() {
        // Given
        let currentQueue = [3]
        let expectation = 3
        
        // When
        sut.queue = currentQueue
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_마지막요소가3일때_3을반환하는지() {
        // Given
        let currentQueue = [1, 2, 3, 4, 5]
        let expectation = 5
        
        // When
        sut.queue = currentQueue
        let result = sut.dequeue()
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}
