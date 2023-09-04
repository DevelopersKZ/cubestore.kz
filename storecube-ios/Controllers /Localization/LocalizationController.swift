import UIKit
import SnapKit

final class LocalizationController: UIViewController {

    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(LocalizationViewCell.self, forCellReuseIdentifier: "Localization_id")
        tableView.backgroundColor = AppColor.searchGray.uiColor
        tableView.layer.cornerRadius = 20
        tableView.rowHeight = 82
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupViews()
        setupConstraints()
    }

    // MARK: - Actions
        
    private func setupNavigationBar() {
        self.navigationItem.title = "Localization"
    }
        
    // MARK: - setupViews
        
    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = AppColor.silver.uiColor
    }

    // MARK: - setupConstraints
        
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-60)
        }
    }
}

extension LocalizationController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Localization_id",
            for: indexPath
        ) as? LocalizationViewCell else {
            fatalError("Could not cast to LocalizationViewCell")
        }
        cell.backgroundColor = AppColor.searchGray.uiColor

        switch indexPath.row {
        case 0:
            cell.configure(with: AppImage.russian.rawValue , localizedName: "Русский")
        case 1:
            cell.configure(with: AppImage.usa.rawValue , localizedName: "English(US)")
        case 2:
            cell.configure(with: AppImage.france.rawValue , localizedName: "Français")
        case 3:
            cell.configure(with: AppImage.german.rawValue , localizedName: "Deutsch")
        case 4:
            cell.configure(with: AppImage.spain.rawValue , localizedName: "Español")
        case 5:
            cell.configure(with: AppImage.italy.rawValue , localizedName: "Italiano")
        case 6:
            cell.configure(with: AppImage.china.rawValue , localizedName: "中文")
        case 7:
            cell.configure(with: AppImage.korean.rawValue , localizedName: "日本語")
        case 8:
            cell.configure(with: AppImage.japan.rawValue , localizedName: "한국어")
        default:
            cell.imageName = nil
            cell.localizedName = nil
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
