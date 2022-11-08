import UIKit

class ShowPhotoViewController: UIViewController {

    private let leftButton = CustomButton.instanceFromNib()
    private let rightButton = CustomButton.instanceFromNib()

    private let customImageView = CustomImageView.instanceFromNib()
    private let customTextField = CustomTextField.instanceFromNib()

    override func viewDidLoad() {
        super.viewDidLoad()

        leftButton.button.addTarget(self, action: #selector(touchDownLeftButton), for: .touchDown)
        rightButton.button.addTarget(self, action: #selector(touchDownRightButton), for: .touchDown)

        customImageView.configure(image: nil)
//        customImageView.imageView.image = UIImage(systemName: "plus")

        view.addSubview(customImageView)
        view.addSubview(customTextField)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        constraints()

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)
    }

    override func viewDidLayoutSubviews() {
        leftButton.configure(text: "<", systemNameImage: nil)
        rightButton.configure(text: ">", systemNameImage: nil)
//        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    private func constraints(){
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



    @objc private func swipeDetected() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func touchDownLeftButton() {
        UIView.animate(withDuration: 0.2) {
            self.leftButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
        }
    }

    @objc private func touchDownRightButton() {
        UIView.animate(withDuration: 0.2) {
            self.rightButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
        }
    }
}
