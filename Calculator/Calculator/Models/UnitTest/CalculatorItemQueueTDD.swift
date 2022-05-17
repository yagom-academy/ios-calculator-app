import XCTest

class CalculatorItemQueueTDD: XCTestCase {
    // TODO: First in first out 형태의 자료구조인 'Queue'를 만들기
    var intQueue: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        intQueue = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        intQueue = nil
    }
    
    // MARK: - First in fisrt out Tests
    func test_선입선출인지_확인() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation1: Int = 1
        let expectation2: Int = 2
        let expectation3: Int = 3
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        intQueue.push(element: inputValue3)
        
        // then
        XCTAssertEqual(intQueue.pop(), expectation1)
        XCTAssertEqual(intQueue.pop(), expectation2)
        XCTAssertEqual(intQueue.pop(), expectation3)
        
    }
    

}
