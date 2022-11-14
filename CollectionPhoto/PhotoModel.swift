import UIKit

final class PhotoModel {

    let name: String
    let image: UIImage?

    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }

    deinit{
        print("PhotoModel deinited")
    }

}
