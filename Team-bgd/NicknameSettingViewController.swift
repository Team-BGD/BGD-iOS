import UIKit

final class NicknameSettingViewController: UIViewController {
    @IBOutlet weak var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.backgroundColor = .white.withAlphaComponent(0.1)
        nicknameTextField.layer.cornerRadius = 25
        nicknameTextField.clipsToBounds = true
        nicknameTextField.attributedPlaceholder = .init(string: "닉네임 설정", attributes: [
            .foregroundColor: UIColor(red: 0.37, green: 0.4, blue: 0.46, alpha: 1)
        ])
        nicknameTextField.textColor = .white
    }
    
    @IBAction func makeTree(_ sender: UITextField) {
        if let name = nicknameTextField.text, !name.isEmpty {
            UserDefaults.standard.set(name, forKey: "NICKNAME")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
