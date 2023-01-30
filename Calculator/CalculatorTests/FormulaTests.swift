//  CalculatorItemQueueTests - FormulaTests.swift
//  created by vetto on 2023/01/27

import Foundation

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    // MARK: - result method test
    func test_operandsqueue에_아무것도_넣지_않고_result를_호출하면_값은_0이다() {
    }
    
    func test_operandsqueue에_1점3을_넣고_result를_호출하면_1점3이다() {
    }
    
    func test_operatorsqueue에_add를_넣고_result를_호출하면_0이_나온다() {
    }
    
    func test_operandsqueue에_1과2를_넣고_operatorsqueue에_add를_넣고_실행하면_결과값은_3이다() {
    }
    
    func test_operandsqueue에_2와3을_넣고_operatorsqueue에_subtract를_넣고_실행하면_결과값은_마이너스1이다() {
    }
    
    func test_operandsqueue에_3과6을_넣고_operatorsqueue에_divide를_넣고_실행하면_결과값은_0점5이다() {
    }
    
    func test_operandsqueue에_4와6을_넣고_operatorsqueue에_multiply를_넣고_실행하면_결과값은_24이다() {
    }
    
    func test_operandsqueue에_4와0을_넣고_operatorsqueue에_divide를_넣고_실행하면_결과값은_nan이다() {
    }
}
