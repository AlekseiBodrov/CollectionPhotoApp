import UIKit

final class Cell: UICollectionViewCell {

    lazy var firstImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    lazy var containerView: UIView = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)

        containerView.addSubview(firstImage)
        contentView.addSubview(containerView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        firstImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            firstImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            firstImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            firstImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            firstImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }


    func configure(with photo: PhotoModel) {
        firstImage.image = photo.image
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
    }

}
