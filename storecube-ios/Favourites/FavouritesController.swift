//
//  FavouritesController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 08.07.2023.
//

import UIKit
import SnapKit

final class FavouritesController: UIViewController {
    
    // MARK: - UI
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "favourites_id")
        tableView.rowHeight = 120
        tableView.backgroundColor = AppColor.searchGray.uiColor
        tableView.layer.cornerRadius = 24
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - Actions
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Favourite"
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = AppColor.silver.uiColor
    }

    // MARK: - setupConstraints
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-115)
        }
    }
}

extension FavouritesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "favourites_id",
            for: indexPath
        ) as? FavouriteTableViewCell else {
            fatalError("Could not cast to file")
        }
        cell.backgroundColor = AppColor.searchGray.uiColor
        return cell
    }
}
