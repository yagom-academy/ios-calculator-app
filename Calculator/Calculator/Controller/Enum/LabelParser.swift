//
//  LabelParser.swift
//  Calculator
//
//  Created by Min Hyun on 2023/06/09.
//

enum LabelParser {
    static func getDefaultLabelValues() -> LabelValues {
        return (operandValue: CalculatorNamespace.Zero,
                operatorValue: CalculatorNamespace.Empty)
    }
    
    static func getNaNLabelValues() -> LabelValues {
        return (operandValue: CalculatorNamespace.NaN,
                operatorValue: CalculatorNamespace.Empty)
    }
    
    static func parseLabelValues(button: ButtonType,
                                 buttonTitle: String,
                                 labelValues: LabelValues,
                                 isReset: Bool) -> LabelValues {
        switch button {
        case .allClear:
            return getDefaultLabelValues()
        case .clearEntry:
            return (operandValue: CalculatorNamespace.Zero,
                    operatorValue: labelValues.operatorValue)
        case .signToggle:
            return parseLabelForSignToggle(labelValues: labelValues)
        case .operators:
            return (operandValue: CalculatorNamespace.Zero,
                    operatorValue: buttonTitle)
        case .dot:
            return parseLabelForDot(labelValues: labelValues, isReset: isReset)
        case .doubleZero:
            return parseLabelForDoubleZero(labelValues: labelValues, isReset: isReset)
        case .numbers:
            return parseLabelForNumbers(for: buttonTitle,
                                        labelValues: labelValues,
                                        isReset: isReset)
        default:
            return labelValues
        }
    }
    
    static func parseLabelForEqual(result calculatorResult: Double) -> LabelValues {
        let operandResult = OperandFormatter.formatDoubleToString(calculatorResult)
        
        return (operandValue: operandResult,
                operatorValue: CalculatorNamespace.Empty)
    }
    
    private static func parseLabelForDot(labelValues: LabelValues, isReset: Bool)
    -> LabelValues {
        guard !isReset else {
            return (operandValue: CalculatorNamespace.Zero + CalculatorNamespace.Dot,
                    operatorValue: labelValues.operatorValue)
        }
        
        guard !labelValues.operandValue.contains(CalculatorNamespace.Dot) else {
            return labelValues
        }
        
        return (operandValue: labelValues.operandValue + CalculatorNamespace.Dot,
                operatorValue: labelValues.operatorValue)
    }
    
    private static func parseLabelForDoubleZero(labelValues: LabelValues, isReset: Bool)
    -> LabelValues {
        guard labelValues.operandValue != CalculatorNamespace.Zero, !isReset else {
            return (operandValue: CalculatorNamespace.Zero,
                    operatorValue: labelValues.operatorValue)
        }
        
        return (operandValue: labelValues.operandValue + CalculatorNamespace.DoubleZero,
                operatorValue: labelValues.operatorValue)
    }

    private static func parseLabelForNumbers(for menu: String,
                                             labelValues: LabelValues,
                                             isReset: Bool)
    -> LabelValues {
        guard labelValues.operandValue != CalculatorNamespace.Zero, !isReset
        else {
            return (operandValue: menu,
                    operatorValue: labelValues.operatorValue)
        }
        
        return (operandValue: labelValues.operandValue + menu,
                operatorValue: labelValues.operatorValue)
    }
    
    private static func parseLabelForSignToggle(labelValues: LabelValues) -> LabelValues {
        guard labelValues.operandValue != CalculatorNamespace.Zero,
              let operandNumber = Double(labelValues.operandValue)
        else {
            return (operandValue: labelValues.operandValue,
                    operatorValue: labelValues.operatorValue)
        }
        
        let newOperand = OperandFormatter.formatDoubleToString(operandNumber * (-1))
        
        return (operandValue: newOperand,
                operatorValue: labelValues.operatorValue)
    }
}

