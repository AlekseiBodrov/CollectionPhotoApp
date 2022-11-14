import UIKit

class BaseController: UIViewController {

    //MARK: - var\let
    let customImageView = CustomImageView.instanceFromNib()
    let customTextField = CustomTextField.instanceFromNib()

    let leftButton = CustomButton.instanceFromNib()
    let rightButton = CustomButton.instanceFromNib()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        constraints()
    }

    //MARK: - objc funcs
    @objc func touchDownLeftButtonPressed() {
        UIView.animate(withDuration: 0.2) {
            self.leftButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
            self.actionForLeftButton()
        }
    }

    @objc func touchDownRightButtonPressed() {
        UIView.animate(withDuration: 0.2) {
            self.leftButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
            self.actionForRightButton()
        }
    }

    //MARK: - flow funcs
    func configure() {
        leftButton.button.addTarget(self, action: #selector(touchDownLeftButtonPressed), for: .touchDown)
        rightButton.button.addTarget(self, action: #selector(touchDownRightButtonPressed), for: .touchDown)

        customImageView.configure(image: nil)

        view.addSubview(customImageView)
        view.addSubview(customTextField)

        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }

    func constraints(){
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customTextField.translatesAutoresizingMaskIntoConstraints = false

        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            customImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            customImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            customTextField.topAnchor.constraint(equalTo: customImageView.bottomAnchor,constant: 15),
            customTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            leftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    func actionForLeftButton() {}

    func actionForRightButton() {}

}
