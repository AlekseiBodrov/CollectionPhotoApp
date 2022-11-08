import UIKit

class AuthorizationViewController: UIViewController {

    private let leftButton = CustomButton.instanceFromNib()
    private let rightButton = CustomButton.instanceFromNib()

    override func viewDidLoad() {
        super.viewDidLoad()

        leftButton.button.addTarget(self, action: #selector(touchDownLeftButton), for: .touchDown)
        rightButton.button.addTarget(self, action: #selector(touchDownRightButton), for: .touchDown)

        view.addSubview(leftButton)
        view.addSubview(rightButton)
        constraints()
    }

    override func viewDidLayoutSubviews() {
        leftButton.configure(text: nil, systemNameImage: nil)
        rightButton.configure(text: "+", systemNameImage: nil)
//        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    private func constraints(){
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            leftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    @objc private func touchDownLeftButton() {
        UIView.animate(withDuration: 0.2) {
            self.leftButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoViewController") as? ShowPhotoViewController else { return }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @objc private func touchDownRightButton() {
        UIView.animate(withDuration: 0.2) {
            self.rightButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AppendPhotoViewController") as? AppendPhotoViewController else { return }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }


}
