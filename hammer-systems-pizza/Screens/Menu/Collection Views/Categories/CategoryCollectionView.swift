//
//  CategoryCollectionView.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class CategoriesCollectionView: UICollectionView {
    var categories: [MenuModels.Category] {
        didSet {
         reloadCollectionView()
        }
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
  
        self.categories = .init()
        super.init(frame: .zero, collectionViewLayout: layout)
        congifureView()
        registerCell()
    }
    
    func congifureView() {
        backgroundColor = .lightGrayBackground
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
    }
    
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func registerCell() {
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// CollectionView Delegates
extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
  
        cell.categoryName.text = categories[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
