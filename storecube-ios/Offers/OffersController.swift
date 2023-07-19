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
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        return cell
    }
}
