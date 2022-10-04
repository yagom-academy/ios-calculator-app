import UIKit

class FormulaStackView: UIStackView {
    //MARK: - FormulaStackView Properties
    private(set) var formula: String = ""
    //MARK: - FormulaStackView Method
    func appendFormula(combining operatorLabel: OperatorLabel, to numberLabel: NumberLabel) {
        guard let number = numberLabel.text else {
            return
        }
        
        let stackViewCell: UIStackView
        
        if let `operator` = operatorLabel.text {
            formula += `operator` + number
            stackViewCell = StackViewCell(operand: number, operator: `operator`).generateStackView()
        } else {
            formula = number
            stackViewCell = StackViewCell(operand: number, operator: "").generateStackView()
        }
        
        self.addArrangedSubview(stackViewCell)
    }
}
//MARK: - Extension
extension FormulaStackView: Resettable {
    func reset() {
        formula = ""
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
