import UIKit



final class ShowPhotoViewController: BaseController {

    var currentIndex = Manager.photoArray.count - 1

    private var counter = Manager.photoArray.count - 1

    //MARK: - life cycle funcs
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        leftButton.configure(text: "<", systemNameImage: nil)
        rightButton.configure(text: ">", systemNameImage: nil)
//        rightButton.configure(text: nil, systemNameImage: "plus")
    }

    //MARK: - objc funcs
    @objc private func swipeDetected() {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK: - flow funcs
    override func configure() {
        super.configure()
        if Manager.photoArray.isEmpty {
            showDefaultPhoto()
        } else {
            customTextField.textField.text = Manager.photoArray[currentIndex].name
            customImageView.imageView.image = Manager.photoArray[currentIndex].image
        }

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)
    }

    override func actionForLeftButton() {
        super.actionForLeftButton()
        showLastPhoto()
    }

    override func actionForRightButton() {
        super.actionForRightButton()
        showNextPhoto()
    }

    private func showDefaultPhoto() {
        customImageView.imageView.image = UIImage(systemName: "questionmark")
    }

    private func showNextPhoto() {
        counter += 1
        if counter == Manager.photoArray.count {
            counter = 0
        }
        customTextField.textField.text = Manager.photoArray[counter].name
        customImageView.imageView.image = Manager.photoArray[counter].image
    }

    private func showLastPhoto() {
        counter -= 1
        if counter == -1 {
            counter = Manager.photoArray.count - 1
        }
        customTextField.textField.text = Manager.photoArray[counter].name
        customImageView.imageView.image = Manager.photoArray[counter].image
    }
}
