import UIKit

final class CollectionImageViewController: BaseController {

    //MARK: - var\let
    private enum Constants {
        static let space: CGFloat = 15
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()

    //MARK: - life cycle funcs
    override func loadView() {
        self.view = UIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customTextField.removeFromSuperview()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: customImageView.topAnchor, constant: Constants.space),
            collectionView.leadingAnchor.constraint(equalTo: customImageView.leadingAnchor, constant: Constants.space),
            collectionView.trailingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: -Constants.space),
            collectionView.bottomAnchor.constraint(equalTo: customImageView.bottomAnchor,constant: -1),
        ])
    }
    
    //MARK: - flow funcs
    override func configure() {
        super.configure()
        view.addSubview(collectionView)

        collectionView.backgroundColor = .white
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        view.backgroundColor = .white
    }

    override func touchDownRightButtonPressed() {
        super.touchDownRightButtonPressed()
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AppendPhotoViewController") as? AppendPhotoViewController else { return }
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - extension
extension CollectionImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Manager.photoArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Cell else { return UICollectionViewCell() }
        cell.configure(with: Manager.photoArray[indexPath.row])
        return cell
    }
}

extension CollectionImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.frame.size.width - Constants.space) / 2
        return CGSize(width: side, height: side)
    }
}

extension CollectionImageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ShowPhotoViewController") as? ShowPhotoViewController else { return }
        controller.index = indexPath.row
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension CollectionImageViewController: AppendPhotoViewControllerDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}
