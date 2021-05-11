//
//  MenuCollectionView.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class MenuTableView: UITableView {
    
    var menu: [MenuModels.Meal] {
        didSet {
            reloadCollectionView()
            
        }
    }
    
    var bannerCollectionView = BannersCollectionView()
    var categoriesCollectionView = CategoriesCollectionView()
    var topContentView = UIView()
    
    override init(frame: CGRect, style: UITableView.Style) {
        self.menu = .init()
        super.init(frame: frame, style: style)
        categoriesCollectionView.selfDelegateMethods = self
        congifureView()
        registerCell()
    }
    
    func congifureView() {
        delegate = self
        dataSource = self
        backgroundColor = .lightGrayBackground
        
        //TopContentView
        topContentView.frame = CGRect(x: 5, y: 5, width: frame.size.width, height: 120)
        tableHeaderView = topContentView
        topContentView.addSubview(bannerCollectionView)
        bannerCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(topContentView)
        }
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func registerCell() {
        register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

// CollectionView Delegates
extension MenuTableView:  UITableViewDelegate, UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseId, for: indexPath) as! MenuTableViewCell
        if indexPath.row == 0 {
            cell.layer.cornerRadius = 25
            cell.layer.masksToBounds = true
            cell.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
        cell.meal = menu[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return categoriesCollectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y > categoriesCollectionView.frame.origin.y) {
            updateShadowToHeaderSection(view: categoriesCollectionView, isActive: true)
        } else {
            updateShadowToHeaderSection(view: categoriesCollectionView, isActive: false)
        }
    }
    
    func updateShadowToHeaderSection(view: UIView, isActive: Bool) {
        if !isActive {
            view.layer.shadowOffset = .zero
            view.layer.shadowRadius = .zero
        } else {
            view.layer.shadowOffset = CGSize(width: 0, height: 1)
            view.layer.shadowColor = UIColor.lightGray.cgColor
            view.layer.shadowRadius = 5
            view.layer.shadowOpacity = 1
            view.layer.masksToBounds = false
        }
    }
}


extension MenuTableView: CategoriesCollectionViewDelegate {
    func selectedCategory(categoryId: Int) {
        var indexArray: [Int] = .init()
        for (index, item) in menu.enumerated() {
            if item.categoryId == categoryId {
                indexArray.append(index)
            }
        }
        guard !indexArray.isEmpty else { return }
        self.scrollToRow(at: IndexPath(row: indexArray.first!, section: 0), at: .top, animated: true)
    }
}
