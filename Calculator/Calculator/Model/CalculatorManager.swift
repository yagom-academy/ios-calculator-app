//
//  CalculatorHelper.swift
//  Calculator
//
//  Created by yun on 2021/06/30.
//

import Foundation

class CalculatorManager {
// MARK: - touchUpOperandButton Helper

    /// 초기 값 상태에서  0 또는 00 버튼이 눌린 경우 무시
    static func checkZeroButtonIsPressedInInitalValue(notation: String, buttonText: String) -> Bool {
        return isInitialValue(notation: notation) && (buttonText == "0" || buttonText == "00")
    }

// MARK: - touchUpOperatorButton Helper
    
    /// 소수 점 뒤 0제거
    static func removeZerosAfterDecimal(notation: String) -> String {
        guard hasAlreadyDot(notation: notation) else {
            return notation
        }
        
        var convertedNotation: String = ""
        let stackNotation: Stack<String> = Stack<String>()

        for value in notation {
            stackNotation.push(object: String(value))
        }

        while let lastNumber = stackNotation.peek(), lastNumber == "0" {
            stackNotation.pop()
        }

        while let lastNumber = stackNotation.pop() {
            convertedNotation = lastNumber + convertedNotation
        }
        
        return convertedNotation
    }
    
    /// notation이 초기 값 상태인지 확인
    static func isInitialValue(notation: String) -> Bool {
       return notation == ""
    }
    
    /// +/-버튼이 눌렸는지 확인 후, 최종 결과를 알려주기
    static func applyNotationSign(notation: String, isMinus: Bool) -> String {
        guard !isInitialValue(notation: notation) else {
            return notation
        }
        
        let notationSign = isMinus ? "-" : ""
        return "\(notationSign)\(notation)"
    }
    
// MARK: - touchUpDotButton Helper
    
    /// 초기 값 상태에서 .을 눌렀을때, 0.으로 만들기
    static func pasteZeroInFrontOfDot(notation: String) -> String {
        return isInitialValue(notation: notation) ? "0" : notation
    }
    
    /// .이 이미 눌려졌는지 확인하기
    static func hasAlreadyDot(notation: String) -> Bool {
        return notation.contains(".")
    }
    
// MARK: - touchUpEqualButton Helper
    
    /// 최종 중위식 결과를 반환
    static func getFinalInfixResult(validNotation: String, notations: [String]) -> [String] {
        var convertedNotation: [String] = notations
        
        if isInitialValue(notation: validNotation),
           let lastNotation = notations.last,
           let _ = Operator(rawValue: lastNotation) {
            convertedNotation.append("0")
            return convertedNotation
        }

        convertedNotation.append(validNotation)
        return convertedNotation
    }
    
// MARK: - updateLabel Helper
    
    /// 3자리 콤마 적용하기
    static func applyCommaOnThreeDigits(notation: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let doubleNotation = Double(notation)
        
        guard let convertedNotaion = numberFormatter.string(for: doubleNotation) else {
            return nil
        }
        
        return convertedNotaion
    }
    
    /// 실제 레이블에 그려질 notation 값
    static func getTextToBeDrawnToUILabel(notation: String, isMinus: Bool) -> String? {
        // 소수 점 뒤 0제거
        // 3자리 콤마 적용하기
        // +/-버튼이 눌렸는지 확인 후, 최종 결과를 알려주기
        // TODO 숫자는 최대 20자리까지만 표현합니다
        // TODO 0으로 나누기에 대해서는 결과값을 NaN으로 표기합니다
        return isInitialValue(notation: notation) ? "0" : notation
    }
}
