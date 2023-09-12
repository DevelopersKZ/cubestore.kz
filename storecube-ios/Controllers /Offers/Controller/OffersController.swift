//
//  OffersController.swift
//  storecube-ios
//
//  Created by Радмир Тельман on 12.07.2023.
//

import UIKit
import SnapKit

final class OffersController: UIViewController {
    
    private var offers: [CubeOffer] = []
    
    // MARK: - UI
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CouponTableViewCell.self, forCellReuseIdentifier: "Coupon")
        tableView.rowHeight = 148
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
        fetchOffer()
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
    
    // MARK: - fetchOffer
    
    private func fetchOffer() {
        CubeService.fetchOffers { offer, error in
            if let error = error {
                print("Error fetching offer: \(error)")
                return
            }

            if let offer = offer {
                self.offers = offer
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension OffersController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Coupon",
            for: indexPath
        ) as? CouponTableViewCell else {
            fatalError("Could not cast to file")
        }
        cell.backgroundColor = AppColor.silver.uiColor
        let offer = offers[indexPath.row]
        cell.configure(with: offer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
