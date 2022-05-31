import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var calculatingScrollView: UIScrollView!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    private var formula = Formula()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    
    // MARK: - Helpers
    
    private func resetUI() {
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
    
    private func appendText(to Label: UILabel, with text: String) {
        Label.text?.append(text)
    }
    
    private func setLabelsText(`operator`: String, operand: String) {
        operatorLabel.text = `operator`
        operandLabel.text = operand
    }
    
    private func isNotANumber(of error: Error) -> Bool {
        if error as? FormulaError == .notANumber { return true }
        else { return false }
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
        appendText(to: operandLabel, with: tappedNumberText)
    }
    
    @IBAction private func demicalPointButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false else { return }
        guard let tappedDemicalPointText = sender.titleLabel?.text else { return }
        
        appendText(to: operandLabel, with: tappedDemicalPointText)
    }
    
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard let tappedDoubleZeroText = sender.titleLabel?.text else { return }
        
        appendText(to: operandLabel, with: tappedDoubleZeroText)
    }
    
    @IBAction private func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard let operandLabelText = operandLabel.text else { return }
        
        if operandLabelText.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text?.insert("-", at: operandLabelText.startIndex)
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
        
        let newSubview = CalculateStackView(operator: operatorLabelText, operand: operandLabelText)
        mainStackView.addArrangedSubview(newSubview)
        scrollToBottom(of: calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula += ExpressionParser.parse(from: parsingString)
    }

    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else { return }
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        let newSubview = CalculateStackView(operator: operatorLabelText, operand: operandLabelText)
        mainStackView.addArrangedSubview(newSubview)
        scrollToBottom(of: calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula += ExpressionParser.parse(from: parsingString)
        
        switch formula.result() {
        case .success(let data):
            setLabelsText(operator: "", operand: data.removeTrailingZero())
        case .failure(let error):
            if isNotANumber(of: error) { setLabelsText(operator: "", operand: "NaN") }
        }
    }
}
