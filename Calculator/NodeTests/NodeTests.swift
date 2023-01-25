//  NodeTests - NodeTests.swift
//  created by vetto on 2023/01/25

import XCTest

final class NodeTests: XCTestCase {
    var sutString: Node<String>!
    var sutInt: Node<Int>!
    var sutDouble: Node<Double>!
    
    override func setUpWithError() throws {
        sutString = Node(data: "head")
        sutInt = Node(data: 1)
        sutDouble = Node(data: 1.5)
    }

    override func tearDownWithError() throws {
        sutString = nil
        sutInt = nil
        sutDouble = nil
    }
    
    func test_String타입으로_Node가_생성되면_기댓값이랑_일치() {
        let result = sutString.data
        let expectation = "head"
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_Int타입으로_Node가_생성되면_기댓값이랑_일치() {
        let result = sutInt.data
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_Double타입으로_Node가_생성되면_기댓값이랑_일치() {
        let result = sutDouble.data
        let expectation = 1.5
        
        XCTAssertEqual(result, expectation)
    }
}
