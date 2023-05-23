//
//  CollectionViewDiffableDataSourceProvider.swift
//  ios-menu-app
//
//  Created by Sunny on 2023/05/20.
//

import UIKit

// MARK: 추후 makeDataSource, update 모두 extension으로 구현할까 생각 중
protocol CollectionViewDiffableDataSourceProvidable {
    
    associatedtype CellType: CollectionViewCellProvidable
    associatedtype SectionType: Hashable
    
    func makeDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<SectionType, CellType.Item>?
    func update(_ items: [CellType.Item])
}
