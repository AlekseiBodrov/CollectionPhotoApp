import UIKit

class CustomTextField: UIView {

    @IBOutlet weak var textField: UITextField!

    static func instanceFromNib() -> CustomTextField {
        return UINib(nibName: "CustomTextField", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomTextField
    }

    func configure(text: String) {
        textField.text = text
    }
}
