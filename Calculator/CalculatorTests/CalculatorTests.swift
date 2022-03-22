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
    
    func test_LinkedList가_비었을때_isEmpty가_true를_리턴하는가() {
        //given
        
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
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue와dequeue를호출했을때_dequeue가2를_리턴하는가() {
        //given
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_CalculatorItemQueue에_enqueue를두번dequeue를한번호출했을때_dequeue가1를_리턴하는가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_CalculatorItemQueue의_enqueue에3과5를넣고_dequeue를세번했을때_nil을_리턴하는가() {
        //given
        sut.enqueue(3)
        sut.enqueue(5)
        sut.dequeue()
        sut.dequeue()
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_CalculatorItemQueue의_enqueue에123을넣었을때_dequeue가1을_리턴하는가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    
}
