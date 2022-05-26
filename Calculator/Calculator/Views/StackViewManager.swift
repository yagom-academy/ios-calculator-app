import UIKit

struct StackViewManager {
    private static func makeNewCalculateLabels(of operatorText: String, operandText: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let ol = UILabel()
            ol.text = operatorText
            ol.font = UIFont.preferredFont(forTextStyle: .title3)
            ol.textColor = UIColor.white
            ol.textAlignment = .right
            return ol
        }()
        
        let operandLabel: UILabel = {
            let ol = UILabel()
            ol.text = operandText
            ol.font = UIFont.preferredFont(forTextStyle: .title3)
            ol.textColor = UIColor.white
            ol.textAlignment = .right
            return ol
        }()
        
        let stackView: UIStackView = {
            let sv = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
            sv.spacing = 8
            sv.alignment = .fill
            sv.distribution = .fill
            sv.axis = .horizontal
            return sv
        }()
        
        return stackView
    }
    
    static func addCalculateLabels(to stackView: UIStackView, operatorText: String, operandText: String) {
        let newStackView = makeNewCalculateLabels(of: operatorText, operandText: operandText)
        stackView.addArrangedSubview(newStackView)
    }
    
}
