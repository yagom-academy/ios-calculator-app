import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var calculatingScrollView: UIScrollView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    private var formula: Formula?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    
    // MARK: - Helpers
    
    private func resetUI() {
        formula = Formula()
        operatorLabel.text = ""
        operandLabel.text = "0"
        mainStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func scrollToBottom(of scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        let scrollHeight: CGFloat = scrollView.contentSize.height - scrollView.bounds.height
        let scrollViewBottomOffset = CGPoint(x: 0, y: scrollHeight)
        scrollView.setContentOffset(scrollViewBottomOffset, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        resetUI()
    }
    
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction private func operandButtonTapped(_ sender: UIButton) {
        guard let tappedNumberText = sender.titleLabel?.text else { return }
        
        if operandLabel.text == "0" { operandLabel.text = "" }
        operandLabel.text?.append(tappedNumberText)
    }
    
    @IBAction private func demicalPointButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false else { return }
        
        guard let tappedDemicalPointText = sender.titleLabel?.text else { return }
        
        operandLabel.text?.append(tappedDemicalPointText)
    }
    
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        
        guard let tappedDoubleZeroText = sender.titleLabel?.text else { return }
        
        operandLabel.text?.append(tappedDoubleZeroText)
    }
    
    @IBAction private func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        
        if operandLabel.text?.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text?.insert("-", at: operandLabel.text!.startIndex)
        }
    }

    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let tappedOperatorText = sender.titleLabel?.text,
              let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        if operandLabel.text == "0" {
            guard mainStackView.subviews.count != 0 else { return }
            operatorLabel.text = tappedOperatorText
            return
        }
        
        operatorLabel.text = tappedOperatorText
        operandLabel.text = "0"
        
        StackViewManager.addCalculateLabels(to: self.mainStackView,
                                                operatorText: operatorLabelText,
                                                operandText: operandLabelText)
        self.scrollToBottom(of: self.calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: parsingString)
    }

    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else { return }
        
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        StackViewManager.addCalculateLabels(to: self.mainStackView,
                                                operatorText: operatorLabelText,
                                                operandText: operandLabelText)
        self.scrollToBottom(of: self.calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: parsingString)
        
        
        switch formula?.result() {
        case .success(let data):
            operatorLabel.text = ""
            operandLabel.text = data.removeTrailingZero()
        case .failure(let error):
            if error as? FormulaError == FormulaError.notANumber {
                operatorLabel.text = ""
                operandLabel.text = "NaN"
            } else {
                print("Error occurred: ☢️\(error)☢️")
            }
        case .none:
            break
        }
    }
}
