import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.setUpWithError()
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_LinkedList가_비었을때_isEmpty가_true를_리턴하는가() {
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_LinkedList의_element가_존재할때_isEmpty가_false를_리턴하는가() {
        //given
        sut.enqueue(1)
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_CalculatorItemQueue에_enqueue메서드를_한번호출했을때_count가1을_리턴하는가() {
        //given
        sut.enqueue(1)
        
        //when
        let result = sut.countNumber()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_CalculatorItemQueue에_enqueue메서드를_세번호출했을때_count가3을_리턴하는가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.countNumber()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_enqueue와dequeue를호출했을때_count가0을_반환하는가() {
        //given
        sut.enqueue(2)
        sut.dequeue()
        
        //when
        let result = sut.countNumber()
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_CalculatorItemQueue에_enqueue를두번dequeue를한번호출했을때_count가1을_리턴하는가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.dequeue()
        
        //when
        let result = sut.countNumber()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result?.data, 1)
    }
    

    
}
