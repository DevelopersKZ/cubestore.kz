//
//  OffersController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 12.07.2023.
//

import UIKit
import SnapKit

final class OffersController: UIViewController {
    
    // MARK: - UI
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CouponTableViewCell.self, forCellReuseIdentifier: "Coupon")
        tableView.rowHeight = 145
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}

extension OffersController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Coupon",
            for: indexPath
        ) as? CouponTableViewCell else {
            fatalError("Could not cast to file")
        }
        cell.backgroundColor = AppColor.silver.uiColor
        return cell
    }
}
