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
    
    private lazy var favouritesLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourites"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: "Избранные")
        tableView.rowHeight = 118
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN OUT", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(
            red: CGFloat(0x93) / 255.0,
            green: CGFloat(0xC2) / 255.0,
            blue: CGFloat(0xFD) / 255.0,
            alpha: 1.0)
        button.layer.cornerRadius = 14
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [favouritesLabel, tableView, signOutButton ].forEach {
            contentView.addSubview($0)
        }
    }

    // MARK: - setupConstraints
    
    private func setupConstraints() {
        favouritesLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(favouritesLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(53)
        }
    }
}

extension FavouritesController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Избранные", for: indexPath) as! FavouriteTableViewCell
        return cell
    }
}
