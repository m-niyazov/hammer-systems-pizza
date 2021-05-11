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
    var containerView = UIView()
    var menuTableView = MenuTableView()
    
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
        addSubview(containerView)
        containerView.addSubview(menuTableView)
    }
    
    private func addConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        menuTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalTo(containerView)
            make.bottom.equalTo(containerView)
            make.left.equalTo(containerView)
        }
        
    }
    
}

// MARK: - MenuViewLogic
extension MenuView: MenuViewLogic {
    
    func updateBanners(data: [MenuModels.Banner]) {
        menuTableView.bannerCollectionView.banners = data
    }
    
    func updateCategories(data: [MenuModels.Category]) {
        menuTableView.categoriesCollectionView.categories = data
    }
    
    func updateMenu(data: [MenuModels.Meal]) {
        menuTableView.menu = data
        
    }
}
