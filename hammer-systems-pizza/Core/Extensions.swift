//
//  Extensions.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import Foundation
import UIKit

//MARK: - UIColor
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1 ) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    static let appRed = UIColor.rgb(red: 253, green: 58, blue: 105)
    static let appGray = UIColor.rgb(red: 195, green: 196, blue: 201)
    static let lightGrayBackground = UIColor.rgb(red: 243, green: 245, blue: 249)
    
}

//MARK: - UIVIew
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

// MARK: - UIImageView
extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self] in
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
            
        }
    }
}
