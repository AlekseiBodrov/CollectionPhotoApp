import UIKit

final class AuthorizationViewController: BaseController {

//    private let passwordLabel = UILabel()
//    private let passwordTextField = CustomTextField.instanceFromNib()
//    private let singInButton = CustomButton.instanceFromNib()
//    private let singUpButton = CustomButton.instanceFromNib()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
//        customImageView.removeFromSuperview()
//        customTextField.removeFromSuperview()
//
//        passwordTextField.textField.delegate = self
    }

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        leftButton.configure(text: nil, systemNameImage: nil)
//        rightButton.configure(text: "+", systemNameImage: nil)
//    //        rightButton.configure(text: nil, systemNameImage: "plus")
//    }
//
//    override func configure() {
//        super.configure()
//
//        passwordLabel.text = "Password"
//        passwordLabel.textColor = .black
//
//        passwordTextField.placeholder(text: "Set your password")
//
//        singInButton.configure(text: "Sing In", nameImage: nil)
//        singUpButton.configure(text: "Sing Up", nameImage: nil)
//
////        view.addSubview(passwordLabel)
//        view.addSubview(passwordTextField)
//        view.addSubview(singInButton)
//        view.addSubview(singUpButton)
//    }
//
//    //MARK: - flow funcs
//
//    override func actionForLeftButton() {
//        super.actionForLeftButton()
//        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoViewController") as? ShowPhotoViewController else { return }
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//
//    override func actionForRightButton() {
//        super.actionForRightButton()
//        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AppendPhotoViewController") as? AppendPhotoViewController else { return }
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//
//    override func constraints(){
//        super.constraints()
//
//        passwordLabel.translatesAutoresizingMaskIntoConstraints = true
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = true
//        singInButton.translatesAutoresizingMaskIntoConstraints = true
//        singUpButton.translatesAutoresizingMaskIntoConstraints = true
//
//        NSLayoutConstraint.activate([
//
////            passwordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
////            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
////            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
////            passwordLabel.heightAnchor.constraint(equalToConstant: 40.0),
//
//            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
//
//            singInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 15),
//            singInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            singInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            singInButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
//
//            singUpButton.topAnchor.constraint(equalTo: singInButton.bottomAnchor,constant: 15),
//            singUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            singUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            singUpButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor)
//        ])
//    }
}

extension AuthorizationViewController{

}
