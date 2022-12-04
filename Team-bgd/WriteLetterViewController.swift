import UIKit

final class WriteLetterViewController: UIViewController {
    
    @IBOutlet weak var letterTextView: UITextView!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letterTextView.backgroundColor = .white.withAlphaComponent(0.1)
        letterTextView.layer.cornerRadius = 25
        letterTextView.clipsToBounds = true
        letterTextView.textColor = .white
        
        nicknameTextField.backgroundColor = .white.withAlphaComponent(0.1)
        nicknameTextField.layer.cornerRadius = 25
        nicknameTextField.clipsToBounds = true
        nicknameTextField.attributedPlaceholder = .init(string: "닉네임 설정", attributes: [
            .foregroundColor: UIColor(red: 0.37, green: 0.4, blue: 0.46, alpha: 1)
        ])
        nicknameTextField.textColor = .white
    }
}
