import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var enteringNumberLabel: UILabel!
    @IBOutlet weak var enteringOperatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: CalculatorStackView!
    
    private var calculatorChecker = CalculatorProcessor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorChecker.enteringNumberObservable.subscribe { [weak self] enteringNumber in
            self?.enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
        }
        initializeLabel()
    }
    
    @IBAction func didTapNumberPad(_ sender: UIButton) {
        guard let numberPad = sender.currentTitle,
              calculatorChecker.hasSpace == false else { return }
        
        calculatorChecker.appendingNumber(numberPad)
    }
    
    @IBAction private func didTapOperatorPad(_ sender: UIButton) {
        guard let inputOperatorText = sender.currentTitle,
              let currentOperatorText = enteringOperatorLabel.text else { return }
        
        enteringOperatorLabel.text = inputOperatorText
        
        guard calculatorChecker.isEmpty == false,
              let decimalText = enteringNumberLabel.text?.convertToDecimal() else { return }
        
        addFormulaView(decimalText, currentOperatorText)
        calculatorChecker.appendingExpression(currentOperatorText, decimalText)
    }
    
    @IBAction private func didTapZeroPad(_ sender: UIButton) {
        guard let zeroPad = sender.currentTitle,
              calculatorChecker.hasSpace == false else { return }
        
        calculatorChecker.appendingZero(zeroPad)
    }

    @IBAction private func didTapDotPad(_ sender: UIButton) {
        guard calculatorChecker.hasSpace == false else { return }
        
        calculatorChecker.appendingDot()
    }

    @IBAction private func didTapCalculationPad(_ sender: UIButton) {
        guard let operatorText = enteringOperatorLabel.text,
              operatorText.isEmpty == false else { return }
        
        addFormulaView(enteringNumberLabel.text?.convertToDecimal(), enteringOperatorLabel.text)
        calculatorChecker.calculate(operatorText)
        enteringOperatorLabel.text =  Sign.empty
    }

    @IBAction private func didTapACPad(_ sender: UIButton) {
        enteringOperatorLabel.text = Sign.empty
        calculatorChecker.initialState()
        calculatorStackView.removeAllFormulaStackView()
    }

    @IBAction private func didTapCEPad(_ sender: UIButton) {
        calculatorChecker.initialEnteringNumber()
    }

    @IBAction private func didTapChangedSignPad(_ sender: UIButton) {
        guard let enteringNumberText = enteringNumberLabel.text,
              calculatorChecker.isZero(enteringNumberText) == false,
              calculatorChecker.hasSpace == false else { return }
        
        calculatorChecker.changeSign()
    }
    
    private func initializeLabel() {
        enteringNumberLabel.text = Sign.zero
        enteringOperatorLabel.text = Sign.empty
    }
    
    private func addFormulaView(_ operandText: String?, _ operatorText: String?) {
        calculatorStackView.addLabels(operandText: operandText, operatorText: operatorText)
        self.calculatorScrollView.scrollToBottom()
    }
}
