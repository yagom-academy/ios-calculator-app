import XCTest

class LinkedListTTD: XCTestCase {
    // TODO: 다양한 데이터를 담을 수 있는 Linked List 만들기
    var linkedList: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        linkedList = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        linkedList = nil
    }
    
    // MARK: - Add values into linked list.

    func test_값을2개넣으면_count는_2를반환() throws {
        // given
        let inputValue1: Int = 3
        let inputValue2: Int = 3
        let expectation: Int = 2
        
        // what
        linkedList.pushBeforeHead(element: inputValue1)
        linkedList.pushBeforeHead(element: inputValue2)
        
        // then
        XCTAssertEqual(linkedList.count, expectation)
    }
    
    func test_head_쪽에_추가하면_popHead는_추가한값을반환() throws {
        // given
        let inputValue: Int = 7
        let expectation: Int = inputValue
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.popHead(), expectation)
    }
    
    func test_popHead하면_count가_줄어든다() throws {
        // given
        let inputValue: Int = 7
        let expectation1: Int = 1
        let expectation2: Int = 0
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.count, expectation1)
        
        // what
        linkedList.popHead()
        
        // then
        XCTAssertEqual(linkedList.count, expectation2)
    }
    
    func test_peekHead할경우_head의데이터를보여준다() throws {
        // given
        let inputValue: Int = 8
        let expectation: Int = inputValue
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.peekHead(), expectation)
    }
    
    func test_값이없을경우_true를반환() throws {
        // given
        // what
        // then
        XCTAssertTrue(linkedList.isEmpty())
    }
    
    func test_값이있을경우_false를반환() throws {
        // given
        // what
        // then
        XCTAssertTrue(linkedList.isEmpty())
    }

}
