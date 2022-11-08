import UIKit

class AppendPhotoViewController: UIViewController {

    private let rightButton = CustomButton.instanceFromNib()

    private let customImageView = CustomImageView.instanceFromNib()
    private let customTextField = CustomTextField.instanceFromNib()

    override func viewDidLoad() {
        super.viewDidLoad()
        rightButton.button.addTarget(self, action: #selector(touchDownRightButton), for: .touchDown)

        customImageView.configure(image: nil)
        customImageView.imageView.image = UIImage(systemName: "plus")
        
        view.addSubview(customImageView)
        view.addSubview(customTextField)
        view.addSubview(rightButton)

        constraints()

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)

        let recognizerImage = UITapGestureRecognizer(target: self, action: #selector(tapImageDetected))
        customImageView.addGestureRecognizer(recognizerImage)
    }

    override func viewDidLayoutSubviews() {
        rightButton.configure(text: "V", systemNameImage: nil)
//        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    private func constraints(){
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        customTextField.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            customImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            customImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            customImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            customTextField.topAnchor.constraint(equalTo: customImageView.bottomAnchor,constant: 15),
            customTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            customTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    @objc private func tapImageDetected() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @objc private func swipeDetected() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func touchDownRightButton() {
        UIView.animate(withDuration: 0.2) {
            self.rightButton.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        } completion: { _ in

        }
    }
}


extension AppendPhotoViewController:UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.customImageView.imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.customImageView.imageView.image = image
        }

        picker.dismiss(animated: true)
    }
}

