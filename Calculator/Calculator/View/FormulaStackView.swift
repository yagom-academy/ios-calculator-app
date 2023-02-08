import UIKit

final class FormulaStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabels(_ elements: [String]) {
        elements.forEach {
            let label = UILabel()
            label.text = $0
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            self.addArrangedSubview(label)
        }
    }
}
