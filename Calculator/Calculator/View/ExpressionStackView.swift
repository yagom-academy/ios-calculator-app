import UIKit

class ExpressionStackView: UIStackView {
    private let operatorLabel = CalculatorItemLabel()
    private let operandLabel = CalculatorItemLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(operator: String, operand: String) {
        self.init()
        setUp(`operator`, operand)
    }
    
    private func setUp(_ operator: String, _ operand: String) {
        operatorLabel.text = `operator`
        operandLabel.text = operand
        
        self.axis = .horizontal
        self.spacing = 8
        
        self.addArrangedSubview(operatorLabel)
        self.addArrangedSubview(operandLabel)
    }
}
