import UIKit

class CustomButton: UIView {

    @IBOutlet weak var button: UIButton!

    static func instanceFromNib() -> CustomButton {
        return UINib(nibName: "CustomButton", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomButton
    }

    func configure(text: String?, nameImage: String?) {
        if let name = nameImage {
            let image = UIImage(named: name)
            button.setImage(image, for: UIControl.State.normal)
        }
        configure(text: text)
    }

    func configure(text: String?, systemNameImage: String?) {
        if let name = systemNameImage {
            let image = UIImage(systemName: name)
            button.setImage(image, for: UIControl.State.normal)
        }
        configure(text: text)
    }

    private func configure(text: String?) {
        button.titleLabel?.text = text
        button.layer.cornerRadius = 5
    }

}
