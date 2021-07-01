//
//  CalculatorHelper.swift
//  Calculator
//
//  Created by yun on 2021/06/30.
//

import Foundation

class CalculatorHelper {
// MARK: - touchUpOperandButton Helper

    /// 초기 값 상태에서  0 또는 00 버튼이 눌린 경우 무시
    static func checkZeroButtonIsPressedInInitalValue(notation: String, buttonText: String) -> Bool {
        return notation == "" && (buttonText == "0" || buttonText == "00")
    }

// MARK: - touchUpOperatorButton Helper
    
    /// 소수 점 뒤 0제거
    static func removeZerosAfterDecimal(notation: String) -> String {
        guard notation.contains(".") else {
            return notation
        }
        
        var convertedNotation: String = ""
        let stackNotation: Stack<String> = Stack<String>()

        for value in notation.components(separatedBy: "") {
            stackNotation.push(object: value)
        }

        while let lastNumber = stackNotation.peek(), lastNumber == "0" {
            stackNotation.pop()
        }

        while let lastNumber = stackNotation.pop() {
            convertedNotation = lastNumber + convertedNotation
        }
        
        return convertedNotation
    }
    
    /// notation이 초기 값 상태일때, operator는 허용하지 않기
    static func isInitialValue(notation: String) -> Bool {
        return false
    }
    
    /// +/-버튼이 눌렸는지 확인 후, 최종 결과를 알려주기
    static func applyNotationSign(notation: String, isMinus: Bool) -> String {
        return notation
    }
    
// MARK: - touchUpDotButton Helper
    
    /// 초기 값 상태에서 .을 눌렀을때, 0.으로 만들기
    static func pasteZeroInFrontOfDot(notation: String) -> String {
        return notation
    }
    
    /// .이 이미 눌려졌는지 확인하기
    static func hasAlreadyDot(notation: String) -> Bool {
        return false
    }
    
// MARK: - touchUpEqualButton Helper
    
    /// 유효한 중위식인지 확인하기
    static func isVaildInfix(notation: String, notations: [String]) -> Bool {
        return false
    }
    
// MARK: - updateLabel Helper

    /// 3자리 콤마 적용하기
    static func applyCommaOnThreeDigits(notation: String) -> String {
        return notation
    }
    
    /// 실제 레이블에 그려질 notation 값
    static func getTextToBeDrawnToUILabel(notation: String, isMinus: Bool) -> String {
        return notation
    }
}
