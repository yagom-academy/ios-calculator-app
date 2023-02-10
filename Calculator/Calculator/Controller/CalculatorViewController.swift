import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var enteringNumberLabel: UILabel!
    @IBOutlet weak var enteringOperatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: CalculatorStackView!
    
    private var calculatorProcessor = CalculatorProcessor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorProcessor.enteringNumberObservable.subscribe { [weak self] enteringNumber in
            self?.enteringNumberLabel.text = (enteringNumber == Sign.empty) ? Sign.zero : enteringNumber
        }
        initializeLabel()
    }
    
    @IBAction func didTapNumberPad(_ sender: UIButton) {
        guard let numberPad = sender.currentTitle,
              calculatorProcessor.hasSpace == false else { return }
        
        calculatorProcessor.appendingNumber(numberPad)
    }
    
    @IBAction private func didTapOperatorPad(_ sender: UIButton) {
        guard let inputOperatorText = sender.currentTitle,
              let currentOperatorText = enteringOperatorLabel.text else { return }
        
        enteringOperatorLabel.text = inputOperatorText
        
        guard calculatorProcessor.isEmpty == false,
              let decimalText = enteringNumberLabel.text?.convertToDecimal() else { return }
        
        addFormulaView(decimalText, currentOperatorText)
        calculatorProcessor.appendingExpression(currentOperatorText, decimalText)
    }
    
    @IBAction private func didTapZeroPad(_ sender: UIButton) {
        guard let zeroPad = sender.currentTitle,
              calculatorProcessor.hasSpace == false else { return }
        
        calculatorProcessor.appendingZero(zeroPad)
    }

    @IBAction private func didTapDotPad(_ sender: UIButton) {
        guard calculatorProcessor.hasSpace == false else { return }
        
        calculatorProcessor.appendingDot()
    }

    @IBAction private func didTapCalculationPad(_ sender: UIButton) {
        guard let operatorText = enteringOperatorLabel.text,
              operatorText.isEmpty == false else { return }
        
        addFormulaView(enteringNumberLabel.text?.convertToDecimal(), enteringOperatorLabel.text)
        calculatorProcessor.calculate(operatorText)
        enteringOperatorLabel.text =  Sign.empty
    }

    @IBAction private func didTapACPad(_ sender: UIButton) {
        enteringOperatorLabel.text = Sign.empty
        calculatorProcessor.initialState()
        calculatorStackView.removeAllFormulaStackView()
    }

    @IBAction private func didTapCEPad(_ sender: UIButton) {
        calculatorProcessor.initialEnteringNumber()
    }

    @IBAction private func didTapChangedSignPad(_ sender: UIButton) {
        guard let enteringNumberText = enteringNumberLabel.text,
              calculatorProcessor.isZero(enteringNumberText) == false,
              calculatorProcessor.hasSpace == false else { return }
        
        calculatorProcessor.changeSign()
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
