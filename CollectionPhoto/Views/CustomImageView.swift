import UIKit

class CustomImageView: UIView {


    @IBOutlet weak var imageView: UIImageView!

    static func instanceFromNib() -> CustomImageView {
        return UINib(nibName: "CustomImageView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomImageView
    }

    func configure(image: UIImage?) {
        imageView.image = image
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
    }
}
