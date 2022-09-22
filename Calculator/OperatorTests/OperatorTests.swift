//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_Operator타입의_add_case가_생성되는가() {
        //when
        sut = Operator.add
        
        //then
        XCTAssertNotNil(sut)
    }
    
    func test_Operator타입의_subtract_case가_생성되는가() {
        //when
        sut = Operator.subtract
        
        //then
        XCTAssertNotNil(sut)
    }
    
    func test_Operator타입의_divide_case가_생성되는가() {
        //when
        sut = Operator.divide
        
        //then
        XCTAssertNotNil(sut)
    }
    
    func test_Operator타입의_multiply_case가_생성되는가() {
        //when
        sut = Operator.multiply
        
        //then
        XCTAssertNotNil(sut)
    }
    
    func test_Character타입_입력값_a를_Operator타입의_원시값으로_지정하여_Operator를_생성하면_생성된_Operator가_nil인가() {
        //given
        let input: Character = "a"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertNil(sut)
    }
    
    func test_Character타입_입력값_더하기기호를_Operator타입의_원시값으로_지정하여_Operator를_생성하면_생성된_Operator의_case가_add인가() {
        //given
        let input: Character = "+"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.add, sut)
    }
    
    func test_Character타입_입력값_빼기기호를_Operator타입의_원시값으로_지정하여_Operator를_생성하면_생성된_Operator의_case가_subtract인가() {
        //given
        let input: Character = "-"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.subtract, sut)
    }
    
    func test_Character타입_입력값_나누기기호를_Operator타입의_원시값으로_지정하여_Operator를_생성하면_생성된_Operator의_case가_divide인가() {
        //given
        let input: Character = "/"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.divide, sut)
    }
    
    func test_Character타입_입력값_곱하기기호를_Operator타입의_원시값으로_지정하여_Operator를_생성하면_생성된_Operator의_case가_multiply인가() {
        //given
        let input: Character = "*"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.multiply, sut)
    }
    
    func test_입력값_실수2와_실수4를_Operator타입의_add_case를_통해_calculate메소드를_호출하여서_rhs로_실수2를_lhs로_실수4를_입력하면_그_결과가_두개를_더한_실수6과_같은가() {
        //given
        let input: [Double] = [2.0, 4.0]
        
        //when
        sut = Operator.add
        let result: Double = sut.calculate(rhs: input[0], lhs: input[1])
        
        //then
        XCTAssertEqual(6.0, result)
    }
}
