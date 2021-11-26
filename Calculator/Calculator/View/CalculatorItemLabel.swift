import UIKit

class CalculatorItemLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp() {
        self.textColor = .white
        self.font = .preferredFont(forTextStyle: .title3)
    }
}
