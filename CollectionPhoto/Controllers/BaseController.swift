import UIKit

class BaseController: UIViewController {

    //MARK: - var\let
    private var scrollView: UIScrollView = .init()
    private var containerView = UIView()
    var bottomConstraint = NSLayoutConstraint()
    var textY: CGFloat = 0

    let customImageView = CustomImageView.instanceFromNib()
    let customTextField = CustomTextField.instanceFromNib()

    let leftButton = CustomButton.instanceFromNib()
    let rightButton = CustomButton.instanceFromNib()

    //MARK: - life cycle funcs
    override func loadView() {
        self.view = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        configure()
        constraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // расположить на весь экран
        scrollView.frame = view.bounds
        containerView.frame = scrollView.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScrollView()
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
        customTextField.textField.delegate = self

        containerView.addSubview(customTextField)

        containerView.addSubview(leftButton)
        containerView.addSubview(rightButton)

        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
    }

    func constraints(){
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customTextField.translatesAutoresizingMaskIntoConstraints = false

        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            customImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 150),
            customImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            customImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),

            customTextField.topAnchor.constraint(equalTo: customImageView.bottomAnchor,constant: 15),
            customTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            customTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),

            leftButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            leftButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100),

            rightButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            rightButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100)
        ])
    }
    
    private func setupScrollView() {
        scrollView.contentSize = .init(width: view.bounds.width, height: view.bounds.height)
    }

//    private func registerForKeyboardNotifications() {
//         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//     }
//
//    @objc private func keyboardWillShow(_ notification: NSNotification) {
//
//        let userInfo = notification.userInfo!
//        let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
//        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//
//        if notification.name == UIResponder.keyboardWillHideNotification {
//            bottomConstraint.constant = 0
//        } else if textY > keyboardScreenEndFrame.origin.y {
//            bottomConstraint.constant = keyboardScreenEndFrame.height
//            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentSize.height)
//        }
//
//        view.needsUpdateConstraints()
//
//        UIView.animate(withDuration: animationDuration) {
//            self.view.layoutIfNeeded()
//        }
//    }

    func actionForLeftButton() {}

    func actionForRightButton() {}

}
extension BaseController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    func hideKeyboard() {
        view.endEditing(true)
    }
}
