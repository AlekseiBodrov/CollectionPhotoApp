import UIKit

protocol AppendPhotoViewControllerDelegate: AnyObject {
    func reloadData()
}

final class AppendPhotoViewController: BaseController {

    weak var delegate: AppendPhotoViewControllerDelegate?

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.removeFromSuperview()
    }

    override func configure() {
        super.configure()

        customTextField.placeholder(text: "Set name photo")

        showDefaultPhoto()

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)

        let recognizerImage = UITapGestureRecognizer(target: self, action: #selector(tapImageDetected))
        customImageView.addGestureRecognizer(recognizerImage)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rightButton.configure(text: "V", systemNameImage: nil)
   //        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    //MARK: - objc funcs
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

    //MARK: - flow funcs
    override func constraints() {
        super.constraints()
    }

    override func actionForRightButton() {
        super.actionForRightButton()
        saveData()
        delegate?.reloadData()
    }

    func saveData() {
        guard let text = customTextField.textField.text else { return }
        guard let image = customImageView.imageView.image else { return }
        Manager.photoArray.append(PhotoModel(name: text, image: image))

        Manager.photoArray.forEach( { print($0.name) } )
        customTextField.textField.text = nil
        showDefaultPhoto()

        Manager.saveData()


//            Manager.userPickNumber = textInt
//            presentViewController()
    }

    private func showDefaultPhoto() {
        customImageView.imageView.image = UIImage(systemName: "plus")
    }
}

//MARK: - extension
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
