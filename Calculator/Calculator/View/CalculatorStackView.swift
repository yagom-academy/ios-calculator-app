import UIKit

final class CalculatorStackView: UIStackView {
    func addLabels(operandText: String?, operatorText: String?) {
        guard let operandValue = operandText,
              let operatorValue = operatorText else { return }
        
        let formulaLabel = UILabel()
        formulaLabel.font = .preferredFont(forTextStyle: .title3)
        formulaLabel.text = "\(operatorValue) \(operandValue)"
        formulaLabel.textColor = .white
        
        self.addArrangedSubview(formulaLabel)
    }
}
