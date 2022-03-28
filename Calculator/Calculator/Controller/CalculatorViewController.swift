import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var numberZeroButton: UIButton!
    @IBOutlet private weak var numberDoubleZeroButton: UIButton!
    @IBOutlet private weak var numberDotButton: UIButton!
    @IBOutlet private weak var numberOneButton: UIButton!
    @IBOutlet private weak var numberTwoButton: UIButton!
    @IBOutlet private weak var numberThreeButton: UIButton!
    @IBOutlet private weak var numberFourButton: UIButton!
    @IBOutlet private weak var numberFiveButton: UIButton!
    @IBOutlet private weak var numberSixButton: UIButton!
    @IBOutlet private weak var numberSevenButton: UIButton!
    @IBOutlet private weak var numberEightButton: UIButton!
    @IBOutlet private weak var numberNineButton: UIButton!
    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var subtractButton: UIButton!
    @IBOutlet private weak var multiplyButton: UIButton!
    @IBOutlet private weak var divideButton: UIButton!
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperandLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction private func clickNumber(_ sender: Any) {
    }
    
    
    @IBAction private func clickOperator(_ sender: Any) {
    }
    
    
    
    
}

