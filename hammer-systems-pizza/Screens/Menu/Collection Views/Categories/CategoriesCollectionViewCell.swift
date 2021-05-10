//
//  CategoryCollectionViewCell.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let reuseId = "CategoryCell"
    
    override var isSelected: Bool {
        didSet {
            setSelected(isSelected)
        }
    }
    
    lazy var categoryName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .appRed
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appRed.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(categoryName)
        categoryName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected {
            categoryName.font = UIFont.boldSystemFont(ofSize: 13)
            view.layer.borderColor = UIColor.rgb(red: 253, green: 58, blue: 105, alpha: 0.1).cgColor
            view.backgroundColor = UIColor.rgb(red: 253, green: 58, blue: 105, alpha: 0.2)
        } else {
            view.layer.borderColor = UIColor.appRed.cgColor
            view.backgroundColor = .none
        }
    }
}
