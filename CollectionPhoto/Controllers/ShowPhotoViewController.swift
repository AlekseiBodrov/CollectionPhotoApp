import UIKit



final class ShowPhotoViewController: BaseController {

    //MARK: - var\let

    var index: Int = 0

    //MARK: - life cycle funcs

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftButton.configure(text: "<", systemNameImage: nil)
        rightButton.configure(text: ">", systemNameImage: nil)
//        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    //MARK: - objc funcs
    @objc private func swipeDetected() {
        saveTextFromTextField()
        self.navigationController?.popViewController(animated: true)
    }

    //MARK: - flow funcs
    override func configure() {
        super.configure()
        if Manager.photoArray.isEmpty {
            showDefaultPhoto()
        } else {
            customTextField.textField.text = Manager.photoArray[index].name
            customImageView.imageView.image = Manager.photoArray[index].image
        }

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)
    }

    override func actionForLeftButton() {
        super.actionForLeftButton()
        saveTextFromTextField()
        showLastPhoto()
    }

    override func actionForRightButton() {
        super.actionForRightButton()
        saveTextFromTextField()
        showNextPhoto()
    }

    func saveTextFromTextField() {
        guard let text = customTextField.textField.text else { return }
        Manager.photoArray[index].name = text
    }

    private func showDefaultPhoto() {
        customImageView.imageView.image = UIImage(systemName: "questionmark")
    }

    private func showNextPhoto() {
        index += 1

        index = index == Manager.photoArray.count ? 0 : index

        customTextField.textField.text = Manager.photoArray[index].name
        customImageView.imageView.image = Manager.photoArray[index].image
    }

    private func showLastPhoto() {
        index -= 1
        index = index == -1 ? (Manager.photoArray.count - 1) : index

        customTextField.textField.text = Manager.photoArray[index].name
        customImageView.imageView.image = Manager.photoArray[index].image
    }
}
