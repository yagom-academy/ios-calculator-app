import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    
    private var currentFormula = ""
    private var currentNumber: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func convertToDecimal(_ number: Double) -> String{
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        
        guard let value = numberFormat.string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return value
    }
    
    @IBAction private func numberPadTapped(_ sender: UIButton) {
        currentNumber = currentNumber * 10 + Double(sender.tag)
        numberLable.text = convertToDecimal(currentNumber)
        currentFormula += String(sender.tag)
    }
    
    @IBAction private func operatorPadTapped(_ sender: UIButton) {
        operatorLable.text = sender.titleLabel?.text
        currentFormula += sender.titleLabel?.text ?? ""
        currentNumber = 0
    }
    
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        var formula: Formula
        var calculatedResult: Double?
        
        do {
            formula = try ExpressionParser.parse(from: currentFormula)
            calculatedResult = try? formula.result()
        } catch {
            print(error)
        }
        
        numberLable.text = convertToDecimal(calculatedResult ?? 0)
        currentNumber = 0
    }
    
    @IBAction private func ACButtinTapped(_ sender: UIButton) {
        numberLable.text = "0"
        currentFormula = ""
        currentNumber = 0
    }
    
    
}

