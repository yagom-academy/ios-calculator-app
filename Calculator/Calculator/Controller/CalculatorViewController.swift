import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        if numberLable.text == "0" {
            guard sender.tag != 0 else { return }
            numberLable.text = ""
        }
        
        numberLable.text = (numberLable.text ?? "") + String(sender.tag)
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        operatorLable.text = sender.titleLabel?.text
    }
}

