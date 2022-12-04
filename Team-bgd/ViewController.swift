//
//  ViewController.swift
//  Team-bgd
//
//  Created by 최형우 on 2022/12/03.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var candyImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var treeShareButton: UIButton!
    @IBOutlet weak var copyToastView: UIView!
    @IBOutlet weak var copyToastLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 25
        popupView.clipsToBounds = true
        popupView.isHidden = true
        copyToastView.layer.cornerRadius = 10
        copyToastView.clipsToBounds = true
        copyToastView.isHidden = true
        copyToastLabel.isHidden = true
        userLoggedInSetting()
        bind()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        candyImage.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userLoggedInSetting()
    }
    
    @objc func didTap(_ sender: UITapGestureRecognizer) {
        popupView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.popupView.isHidden = true
        }
    }

    private func userLoggedInSetting() {
        if
            let name = UserDefaults.standard.string(forKey: "NICKNAME"),
           !name.isEmpty {
            let text = NSMutableAttributedString(string: "\(name) 님에게\n10개의 편지가 도착했어요!")
            text.setColorForText(textToFind: "\(10)", withColor: .init(red: 0.92, green: 0.39, blue: 0.39, alpha: 1))
            headerLabel.attributedText = text
            
            treeShareButton.setTitle("나의 트리 공유하기", for: .normal)
        } else {
            treeShareButton.setTitle("내 트리 만들기", for: .normal)
        }
    }

    private func bind() {
        treeShareButton.addTarget(for: .touchUpInside) { [weak self] _ in
            if
                let name = UserDefaults.standard.string(forKey: "NICKNAME"),
               !name.isEmpty {
                UIPasteboard.general.string = "https://teamdgb.page.link/link?nickname=형우"
                self?.copyToastView.isHidden = false
                self?.copyToastLabel.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self?.copyToastView.isHidden = true
                    self?.copyToastLabel.isHidden = true
                }
            } else {
                let storyboard = UIStoryboard(name: StoryboardConstant.storyboardName, bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(identifier: StoryboardConstant.nickname)
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    func setFontForText(textToFind: String, withFont font: UIFont) {
        let range : NSRange = self.mutableString.range(of: textToFind,options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
