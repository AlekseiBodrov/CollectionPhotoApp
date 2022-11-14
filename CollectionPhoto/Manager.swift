import UIKit

final class Manager {

    private var counter: Int = 0

    static var photoArray = [PhotoModel]()
    init(counter: Int) {
        self.counter = counter

        loadData()
    }

    deinit{

        for (index, value) in Manager.photoArray.enumerated() {
            counter = index
            let text = value.name
            UserDefaults.standard.set(text, forKey: Manager.photoArray[index].name)

        }
        UserDefaults.standard.set(counter, forKey: "counter")

        print("Manager deinited")
    }

    static func saveData() {
        if let image = UIImage(named: "ASDASD") {
            let imageName = Manager.saveImage(image: image)
            UserDefaults.standard.set(imageName, forKey: "image")
        }
    }

    func loadData(){
        guard let imageName = UserDefaults.standard.value(forKey: "image") as? String else { return }
        if let image = loadImage(fileName: imageName) {
            let photo = PhotoModel(name: "image", image: image)
            Manager.photoArray.append(photo)
        }
    }

    static func saveImage(image: UIImage) -> String? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = UUID().uuidString
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return nil }

        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let error {
                print("couldn't remove file at path", error)
            }
        }

        do {
            try data.write(to: fileURL)
            return fileName
        } catch let error {
            print("error saving file with error", error)
            return nil
        }
    }

    func loadImage(fileName: String) -> UIImage? {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let imageUrl = documentsDirectory.appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }
        return nil
    }

}
