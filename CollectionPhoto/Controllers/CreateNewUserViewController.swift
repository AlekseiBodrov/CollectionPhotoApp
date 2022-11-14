import UIKit

final class CreateNewUserViewController: BaseController {

    //MARK: - var\let
    let mailTextField = CustomTextField.instanceFromNib()
    let passwordTextField = CustomTextField.instanceFromNib()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        customImageView.removeFromSuperview()
        customTextField.removeFromSuperview()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftButton.configure(text: nil, systemNameImage: nil)
        rightButton.configure(text: "+", systemNameImage: nil)
    //        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    //MARK: - flow funcs
    override func configure() {
        super.configure()

        mailTextField.placeholder(text: "Set your mail")
        passwordTextField.placeholder(text: "Set your password")
        view.addSubview(mailTextField)
        view.addSubview(passwordTextField)
    }

    override func actionForLeftButton() {
        super.actionForLeftButton()
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoViewController") as? ShowPhotoViewController else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }

    override func actionForRightButton() {
        super.actionForRightButton()
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AppendPhotoViewController") as? AppendPhotoViewController else { return }
        self.navigationController?.pushViewController(controller, animated: true)
    }

    override func constraints(){
        super.constraints()
        mailTextField.translatesAutoresizingMaskIntoConstraints = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = true

        NSLayoutConstraint.activate([


//            mailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mailTextField.heightAnchor.constraint(equalToConstant: 40),

//            passwordTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 30),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: mailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: mailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
