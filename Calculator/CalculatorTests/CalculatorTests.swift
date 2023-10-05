//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Charles on 2023/10/05.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_왼쪽컨테이너에_요소가있을때_마지막요소를_빼내는지() {
        // given
        sut.leftContainer = [1, 2, 3]
        sut.rightContainer = []
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result!, sut.leftContainer.last)
    }
    
    func test_왼쪽컨테이너에_요소가없을때_오른쪽컨테이너에서요소를_빼내는지() {
        // given
        sut.leftContainer = []
        sut.rightContainer = [3, 1, 17]
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result!, sut.rightContainer.first)
    }
    
    func test_왼쪽컨테이너가_비었을때_오른쪽컨테이너가뒤집혀_왼쪽컨테이너에_할당되는지() {
        // given
        sut.leftContainer = []
        sut.rightContainer = [4, 2, 7]
        
        // when
        sut.dequeue()
        
        // then
        XCTAssertEqual(sut.leftContainer, [7, 2, 4])
    }
    
    func test_뒤집힌요소들이들어간_왼쪽컨테이너에서_마지막요소가_제대로빠져나오는지() {
        // given
        sut.leftContainer = []
        sut.rightContainer = [4, 2, 7]
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, 4)
    }
}
