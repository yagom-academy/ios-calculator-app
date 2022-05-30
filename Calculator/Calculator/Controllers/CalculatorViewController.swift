import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var calculatingScrollView: UIScrollView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var formula: Formula?
    var mainStackViewInCalculatingScrollView: UIStackView {
        calculatingScrollView.subviews.compactMap { $0 as? UIStackView }[0]
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    
    // MARK: - Helpers
    
    func resetUI() {
        formula = Formula()
        operatorLabel.text = ""
        operandLabel.text = "0"
        mainStackViewInCalculatingScrollView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func scrollToBottom(of scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        let scrollHeight: CGFloat = scrollView.contentSize.height - scrollView.bounds.height
        let scrollViewBottomOffset = CGPoint(x: 0, y: scrollHeight)
        scrollView.setContentOffset(scrollViewBottomOffset, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        resetUI()
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        guard let tappedNumberText = sender.titleLabel?.text else { return }
        if operandLabel.text == "0" { operandLabel.text = "" }
        operandLabel.text?.append(tappedNumberText)
    }
    
    @IBAction func demicalPointButtonTapped(_ sender: UIButton) {
        guard operandLabel.text?.contains(".") == false else { return }
        guard let tappedDemicalPointText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDemicalPointText)
    }
    
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard let tappedDoubleZeroText = sender.titleLabel?.text else { return }
        operandLabel.text?.append(tappedDoubleZeroText)
    }
    
    @IBAction func signButtonTapped(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        if operandLabel.text?.first == "-" {
            operandLabel.text?.removeFirst()
        } else {
            operandLabel.text?.insert("-", at: operandLabel.text!.startIndex)
        }
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let tappedOperatorText = sender.titleLabel?.text,
              let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        if operandLabel.text == "0" {
            guard mainStackViewInCalculatingScrollView.subviews.count != 0 else { return }
            operatorLabel.text = tappedOperatorText
            return
        }
        
        operatorLabel.text = tappedOperatorText
        operandLabel.text = "0"
        
        StackViewManager.addCalculateLabels(to: self.mainStackViewInCalculatingScrollView,
                                                operatorText: operatorLabelText,
                                                operandText: operandLabelText)
        self.scrollToBottom(of: self.calculatingScrollView)
        
        let parsingString = operatorLabelText + " " + operandLabelText
        formula? += ExpressionParser.parse(from: parsingString)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard operatorLabel.text != "" else { return }
        
        guard let operatorLabelText = operatorLabel.text,
              let operandLabelText = operandLabel.text else { return }
        
        StackViewManager.addCalculateLabels(to: self.mainStackViewInCalculatingScrollView,
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
