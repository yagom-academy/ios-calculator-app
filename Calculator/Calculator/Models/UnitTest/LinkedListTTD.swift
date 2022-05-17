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
        var linkedList = LinkedList<Int>()
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
        var linkedList = LinkedList<Int>()
        let inputValue: Int = 7
        let expectation: Int = inputValue
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.popHead(), expectation)
    }

}
