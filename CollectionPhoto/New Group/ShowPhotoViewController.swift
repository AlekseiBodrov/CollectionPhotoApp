import UIKit

final class ShowPhotoViewController: BaseController {

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

        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)
    }
}
