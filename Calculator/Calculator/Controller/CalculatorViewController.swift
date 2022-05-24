import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    
    private var currentFormula = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        if numberLable.text == "0" {
            guard sender.tag != 0 else { return }
            numberLable.text = ""
        }
        
        numberLable.text = (numberLable.text ?? "") + String(sender.tag)
        currentFormula += numberLable.text ?? ""
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        operatorLable.text = sender.titleLabel?.text
        currentFormula += sender.titleLabel?.text ?? ""
        numberLable.text = ""
    }
    
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var formula: Formula
        var calculatedResult: Double?
        
        do {
            formula = try ExpressionParser.parse(from: currentFormula)
            calculatedResult = try? formula.result()
        } catch {
            print(error)
        }
        
        numberLable.text = String(calculatedResult ?? 0)
    }
    
    @IBAction func ACButtinTapped(_ sender: UIButton) {
        numberLable.text = ""
        currentFormula = ""
    }
    
    
}

