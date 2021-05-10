//
//  MenuView.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import SnapKit
import UIKit

protocol MenuViewLogic: UIView {
    func updateBanners(data: [MenuModels.Banner])
    func updateCategories(data: [MenuModels.Category])
    func updateMenu(data: [MenuModels.Meal])
    
}

final class MenuView: UIView {
    
    // MARK: - Views
    var scrollView = UIScrollView()
    var containerView = UIView()
    
    var bannerCollectionView = BannersCollectionView()
    var categoriesCollectionView = CategoriesCollectionView()
    var menuCollectionView = MenuCollectionView()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .large)
        activityView.color = .orange
        return activityView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        addSubviews()
        addConstraints()
        backgroundColor = .lightGrayBackground
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.addSubview(activityIndicatorView)
        
        containerView.addSubview(bannerCollectionView)
        containerView.addSubview(categoriesCollectionView)
        containerView.addSubview(menuCollectionView)
    }
    
    private func addConstraints() {
        scrollView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        bannerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(10)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            make.height.equalTo(112)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannerCollectionView.snp.bottom).offset(20)
            make.left.equalTo(containerView)
            make.right.equalTo(containerView)
            make.height.equalTo(32)
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(20)
            make.right.equalTo(containerView)
            make.bottom.equalTo(containerView)
            make.left.equalTo(containerView)
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setMenuCollectionHeight() {
        DispatchQueue.main.async { [menuCollectionView] in
            let menuCollectionLayout = menuCollectionView.collectionViewLayout
            let menuCollectionHeight = menuCollectionLayout.collectionViewContentSize.height
            menuCollectionView.snp.makeConstraints { make in
                make.height.equalTo (menuCollectionHeight)
            }
        }
    }
}

// MARK: - MenuViewLogic
extension MenuView: MenuViewLogic {
    
    
    func updateBanners(data: [MenuModels.Banner]) {
        bannerCollectionView.banners = data
    }
    
    func updateCategories(data: [MenuModels.Category]) {
        categoriesCollectionView.categories = data
    }
    
    func updateMenu(data: [MenuModels.Meal]) {
        menuCollectionView.menu = data
        setMenuCollectionHeight()
    }
    
}
