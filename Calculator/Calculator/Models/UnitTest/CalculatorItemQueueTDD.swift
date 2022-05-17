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
    
    func test_peek함수_테스트() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation: Int = 1
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        intQueue.push(element: inputValue3)
        
        // then
        XCTAssertEqual(intQueue.peek(), expectation)
    }
    
    func test_값이있으면_false() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        
        // then
        XCTAssertFalse(intQueue.isEmpty())
    }
    
    func test_값이없으면_true() throws {
        // given
        // what
        
        // then
        XCTAssertTrue(intQueue.isEmpty())
    }
    
    func test_값을2개넣으면_count는_2를반환() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let expectation: Int = 2
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        
        // then
        XCTAssertEqual(intQueue.count, expectation)
    }
    
    func test_서브스크립트로_해당값에_접근() throws {
        // given
        let index: Int = 1
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation: Int = 2
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        intQueue.push(element: inputValue3)
        
        // then
        XCTAssertEqual(intQueue[index], expectation)
    }
    
    func test_반복문사용() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation: [Int] = [1, 2, 3]
        
        // what
        intQueue.push(element: inputValue1)
        intQueue.push(element: inputValue2)
        intQueue.push(element: inputValue3)

        
        // then
        for (i, j) in zip(intQueue, expectation) {
            XCTAssertEqual(i, j)
        }
    }
    
    func test_배열리터럴로초기화하기() throws {
        // what
        let expectation: [Int] = [1, 2, 3, 4]
        
        // given
        intQueue = [1, 2, 3, 4]
        
        // then
        for (i, j) in zip(intQueue, expectation) {
            XCTAssertEqual(i, j)
        }
    }
}
