import UIKit
//MARK: - FormulaStackView
class FormulaStackView: UIStackView {
    //MARK: - FormulaStackView Properties
    private(set) var formula: String = ""
    //MARK: - FormulaStackView Method
    func appendFormula(combining operatorLabel: OperatorLabel, to numberLabel: NumberLabel) {
        guard let number = numberLabel.text else {
            return
        }
        
        if formula.isEmpty == true {
            formula.append(number)
            addSubStackView(including: number)
        } else {
            guard let operatorSign = operatorLabel.text else {
                return
            }
            formula.append(operatorSign + number)
            addSubStackView(including: number, and: operatorSign)
        }
    }
    
    private func addSubStackView(including number: String, and operatorSign: String = "") {
        let subStackView: UIStackView = makeSubStackView()
        let numberLabel: UILabel = UILabel()
        let operatorLabel: UILabel = UILabel()
        
        numberLabel.text = number
        numberLabel.textColor = .white
        operatorLabel.text = operatorSign
        operatorLabel.textColor = .white
        
        subStackView.addArrangedSubview(operatorLabel)
        subStackView.addArrangedSubview(numberLabel)
        
        self.addArrangedSubview(subStackView)
    }
    
    private func makeSubStackView() -> UIStackView {
        let subStackView: UIStackView = UIStackView()
        
        subStackView.axis = .horizontal
        subStackView.alignment = .fill
        subStackView.distribution = .fill
        subStackView.spacing = 8.0
        
        return subStackView
    }
}
//MARK: - Extension
extension FormulaStackView: InitializationProtocol {
    func initialization() {
        formula = ""
        self.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
