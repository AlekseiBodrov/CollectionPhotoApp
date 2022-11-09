import UIKit

final class AuthorizationViewController: BaseController {

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
}
