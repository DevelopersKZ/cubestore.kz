//
//  MainViewController.swift
//  CubeStore
//
//  Created by Ravil on 20.07.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    let sections: [SectionType] = [.promos, .main]
    private var products: [CubeProduct] = []
    
    // MARK: - UI
    
    lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self  
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseID)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseID)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(mainCollectionView)
        view.backgroundColor = AppColor.silver.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sections[sectionIndex] ?? .promos
            switch section {
            case .promos:
                return self?.promoSectionLayout()
            case .main:
                return self?.mainSectionLayout()
            }
        }
    }
    
    // MARK: - fetchProduct
    
    private func fetchProducts() {
        CubeProductService.fetchProducts { product, error in
            if let error = error {
                print("Error fetching offer: \(error)")
                return
            }

            if let product = product {
                self.products = product
                DispatchQueue.main.async {
                    self.mainCollectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - sectionLayout
    
    private func promoSectionLayout() -> NSCollectionLayoutSection {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(300),
                heightDimension: .absolute(160)
            ),
            subitems: [item]
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 15,
            trailing: 16
        )
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    
    private func mainSectionLayout() -> NSCollectionLayoutSection {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(169),
                heightDimension: .absolute(191)
            )
        )
        item.contentInsets.trailing = 20
        // Group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(180)
            ),
            subitem: item,
            count: 2
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 32
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 10,
            trailing: -16
        )
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(43)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .promos:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCollectionViewCell.reuseID,
                for: indexPath
            ) as? BannerCollectionViewCell else {
                fatalError("Could not cast to BannerCollectionViewCell")
            }
            return cell
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionViewCell.reuseID,
                for: indexPath
            ) as? MainCollectionViewCell else {
                fatalError("Could not cast to MainCollectionViewCell")
            }
            cell.buyButtonTappedHandler = {
                self.navigationController?.pushViewController(ProductController(), animated: true)
            }
            let product = products[indexPath.row]
            cell.configure(with: product)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .promos:
            return 3
        case .main:
            return products.count
        }
    }
}
