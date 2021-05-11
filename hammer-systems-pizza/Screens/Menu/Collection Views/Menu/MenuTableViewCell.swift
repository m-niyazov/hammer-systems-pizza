//
//  MenuCollectionViewCell.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    static let reuseId = "MenuCell"
    
    var meal: MenuModels.Meal? {
        didSet {
            setViewValues()
         
        }
    }

    
    lazy var mainImage: CustomIV = {
        let imageView = CustomIV()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .appGray
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.appRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appRed.cgColor
        button.clipsToBounds = true
        return button
    }()
    
    lazy var productInfoBlock: UIView = {
        let view = UIView()
        view.addSubview(title)
        view.addSubview(subtitle)
        view.addSubview(priceButton)
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(subtitle.snp.bottom).offset(16)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(87)
            make.height.equalTo(32)
        }
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let subviews = [mainImage, productInfoBlock]
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 30
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backgroundColor = .white
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        }
    }
    
    func setViewValues() {
        title.text = meal?.name
        subtitle.text = meal?.description
        priceButton.setTitle("От \(meal!.priceFrom) \("₽")", for: .normal)
        mainImage.loadImage(urlStr: meal!.image)
    }
}
