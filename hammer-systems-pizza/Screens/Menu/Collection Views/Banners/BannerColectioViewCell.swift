//
//  BannerColectioViewCellCollectionViewCell.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let reuseId = "BannerCell"
    
    var imageUrlString: String?  {
        didSet {
            guard oldValue != imageUrlString  else { return }
            mainImageView.load(urlString: imageUrlString!)
        }
    }
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
