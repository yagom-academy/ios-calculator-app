//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 박종화 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를_호출하여_1과2와3을_넣었을때_개수가_3이_나오는지() {
        // given
        
        // when
        sut.enqueue("1")
        sut.enqueue("-")
        sut.enqueue("2")
        
        // then
        XCTAssertEqual(sut.count, 3)
    }
    func test_dequeue를_호출하여_1과2와3에서_3을_제거할때_개수가_2개인지() {
        // given 주어지다 / 무언가 주어졌을 때
        sut.enqueue("3")
        sut.enqueue("+")
        sut.enqueue("4")
        
        // when 언제 / 어ㄸ 결과는 이거다
        XCTAssertEqual(sut.dequeue(), "3")
        // then 그렇다면 / 그렇다면 이 케이스는 맞을까?
        XCTAssertEqual(sut.count, 2)
    }
    
    func test_clear이_호출되면_빈배열이_반환되는지() {
        // given 주어지다 / 무언가 주어졌을 때
        // 경계
        sut.enqueue("8")
        sut.enqueue("x")
        sut.enqueue("9")
        
        // when 언제 / 어ㄸ너 결과는 이거다
        sut.clear()
        
        // then 그렇다면 / 그렇다면 이 케이스는 맞을까?
        XCTAssertTrue(sut.isEmpty)
        
    }
}
