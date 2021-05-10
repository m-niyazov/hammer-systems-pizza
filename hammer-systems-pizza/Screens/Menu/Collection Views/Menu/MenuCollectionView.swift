//
//  MenuCollectionView.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class MenuCollectionView: UICollectionView {
    var menu: [MenuModels.Meal] {
        didSet {
            reloadCollectionView()
        }
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        self.menu = .init()
        super.init(frame: .zero, collectionViewLayout: layout)
        congifureView()
        registerCell()
    }
 
    
    func congifureView() {
        backgroundColor = .white
        layer.cornerRadius = 25
        clipsToBounds = true
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        isScrollEnabled = false
        delegate = self
        dataSource = self
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func registerCell() {
        register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// CollectionView Delegates
extension MenuCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseId, for: indexPath) as! MenuCollectionViewCell
        
        cell.meal = menu[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: 155)
    }
}
