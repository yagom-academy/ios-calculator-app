////
////  FormulaTests.swift
////  CalculatorTests
////
////  Created by JeongTaek Han on 2021/11/14.
////
//
//import XCTest
//
//class FormulaTests: XCTestCase {
//    
//    var operators: CalculatorItemQueue<Operator>!
//    var operands: CalculatorItemQueue<Double>!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        operators = CalculatorItemQueue()
//        operands = CalculatorItemQueue()
//    }
//
//    override func tearDownWithError() throws {
//        try super.tearDownWithError()
//        operands = nil
//        operators = nil
//    }
//
////    func test_2_더하기_3_빼기_4_더하기_5의_result로_6을_반환하는가() throws {
////        // given
////        operands.enqueue(2.0)
////        operands.enqueue(3.0)
////        operands.enqueue(4.0)
////        operands.enqueue(5.0)
////
////        operators.enqueue(.add)
////        operators.enqueue(.subtract)
////        operators.enqueue(.add)
////
////        let formula = Formula(operands: operands, operators: operators)
////
////        // when
////        let result = formula.result()
////
////        // then
////        XCTAssertEqual(result, 6.0)
////    }
//    
//    func test_2_더하기_3_빼기_4_더하기_5의_result로_6을_반환하는가() throws {
//           // given
//           operands.enqueue(2.0)
//           operands.enqueue(3.0)
//   
//           operators.enqueue(.add)
//   
//           let formula = Formula(operands: operands, operators: operators)
//   
//           // when
//           let result = formula.result()
//   
//           // then
//           XCTAssertEqual(result, 5.0)
//       }
//    
//    func test_빈_formula가_0을_반환하는가() {
//        let formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
//        let result = formula.result()
//        XCTAssertEqual(result, 0.0)
//    }
//}
