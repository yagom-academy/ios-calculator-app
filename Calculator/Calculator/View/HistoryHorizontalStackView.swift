import UIKit

class HistoryHorizontalStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(lhsLabel: UILabel, rhsLebel: UILabel) {
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.spacing = 8
        self.distribution = .fill
        self.alignment = .fill
        
        self.addArrangedSubview(lhsLabel)
        self.addArrangedSubview(rhsLebel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
