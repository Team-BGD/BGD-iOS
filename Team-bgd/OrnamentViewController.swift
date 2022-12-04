import UIKit

final class OrnamentViewController: UIViewController {
    @IBOutlet weak var cookieView: UIView!
    @IBOutlet weak var santaView: UIView!
    @IBOutlet weak var rudolfView: UIView!
    @IBOutlet weak var christmasBallView: UIView!
    @IBOutlet weak var bellView: UIView!
    @IBOutlet weak var socksView: UIView!
    @IBOutlet weak var iceBallView: UIView!
    @IBOutlet weak var pineConeView: UIView!
    @IBOutlet weak var candyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        [cookieView, santaView, rudolfView, christmasBallView, bellView, socksView, iceBallView, pineConeView, candyView]
            .forEach { view in
                view?.layer.cornerRadius = 15
                view?.clipsToBounds = true
            }
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        cookieView.addGestureRecognizer(gesture)
    }

    @objc func didTap(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: StoryboardConstant.storyboardName, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: StoryboardConstant.writeLetter)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
