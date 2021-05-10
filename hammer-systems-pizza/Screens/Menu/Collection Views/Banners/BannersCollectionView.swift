//
//  CollectioView.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class BannersCollectionView: UICollectionView {
    var banners: [MenuModels.Banner] {
        didSet {
         reloadCollectionView()
        }
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        self.banners = .init()
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
        register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// CollectionView Delegates
extension BannersCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseId, for: indexPath) as! BannerCollectionViewCell
        cell.imageUrlString = banners[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width * 0.9
        let contentLeftInset = 15
        let contentRightInset = 15
        let readyWidth = screenWidth - CGFloat(contentLeftInset + contentRightInset)
        return CGSize(width: readyWidth, height: 112)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
