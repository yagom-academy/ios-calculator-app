import UIKit

class ProcessLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.adjustsFontForContentSizeCategory = true
        self.adjustsFontSizeToFitWidth = true
        self.textColor = .white
        self.font = UIFont.preferredFont(forTextStyle: .title3)
        self.baselineAdjustment = .alignBaselines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
