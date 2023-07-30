//
//  SearchController.swift
//  CubeStore
//
//  Created by Радмир Тельман on 29.07.2023.
//

import UIKit
import SnapKit

final class SearchController: UIViewController {

    // MARK: - UI
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.searchGray.uiColor
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var searchImageView: UIView = {
        let imageView = UIImageView()
        imageView.image = AppImage.research.uiImage
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search..."
        textField.font = UIFont(name: "Montserrat-Regular", size: 18)
        textField.backgroundColor = AppColor.searchGray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 16
        textField.textColor = AppColor.black.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "Поиск")
        tableView.backgroundColor = AppColor.searchGray.uiColor
        tableView.layer.cornerRadius = 16
        tableView.rowHeight = 110
        tableView.dataSource = self
        tableView.delegate = self
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
        [searchTextField, searchView, tableView, searchImageView].forEach(){
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        searchView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-310)
            make.height.equalTo(53)
        }
        
        searchImageView.snp.makeConstraints(){ make in
            make.centerY.equalTo(searchView)
            make.centerX.equalTo(searchView)
            make.size.equalTo(22)
        }
        
        searchTextField.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalTo(searchView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(53)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(0)
        }
    }
}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Поиск", for: indexPath) as! SearchTableViewCell
        cell.backgroundColor = AppColor.searchGray.uiColor
        return cell
    }
}
