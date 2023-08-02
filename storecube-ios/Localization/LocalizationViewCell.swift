import UIKit
import SnapKit

final class LocalizationViewCell: UITableViewCell {

    // MARK: - UI

    private lazy var countryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Medium", size: 20)
        return label
    }()

    // MARK: - Properties

    var imageName: UIImage? {
        didSet {
            countryImageView.image = imageName
        }
    }

    var localizedName: String? {
        didSet {
            nameLabel.text = localizedName
        }
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - setupViews

    private func setupViews() {
        [countryImageView, nameLabel].forEach {
            contentView.addSubview($0)
        }
    }

    // MARK: - setupConstraints

    private func setupConstraints() {
        countryImageView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(countryImageView.snp.trailing).offset(30)
        }
    }

    // MARK: - Configure Cell

    func configure(with imageName: String, localizedName: String) {
        self.imageName = UIImage(named: imageName)
        self.localizedName = localizedName
    }
}
