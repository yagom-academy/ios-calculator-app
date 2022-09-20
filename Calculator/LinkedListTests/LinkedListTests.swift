//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Hamo on 2022/09/20.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList!

    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_HI를_append했을때잘들어가는지() {
        sut.append(data: "HI")
        
        guard let result = sut.removeFirst() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
    }
    
    func test_HI랑HO를_append했을때잘들어가는지() {
        sut.append(data: "HI")
        sut.append(data: "HO")
        
        guard let result = sut.removeFirst() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
        
        guard let result = sut.removeFirst() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HI")
    }
    
    func test_HI랑HO랑HU를_append한후removeAll을이용하여전부삭제가가능한지() {
        sut.append(data: "HI")
        sut.append(data: "HO")
        sut.append(data: "HU")
        sut.removeAll()
        
        XCTAssertEqual(sut.head == nil && sut.tail == nil, true)
    }
    
    func test_HI랑HO랑HU를_append한후_제일마지막요소가HI인지() {
        sut.append(data: "HI")
        sut.append(data: "HO")
        sut.append(data: "HU")
        
        guard let result = sut.tail?.bringData() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HU")
    }
    
    func test_HI랑HO를append하고HI를removeAll하고_HU를다시append했을때_head가HO인지() {
        sut.append(data: "HI")
        sut.append(data: "HO")
        
        let _ = sut.removeFirst()
        
        sut.append(data: "HU")
        
        guard let result = sut.head?.bringData() as? String else {
            return
        }
        
        XCTAssertEqual(result, "HO")
    }
}

