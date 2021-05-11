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
// MARK: - UIImageView & Code from StackOverFlow for load Images
// Task - Rewrite later
let imageCache = NSCache<NSString, UIImage>()
class CustomIV: UIImageView {
    var imageUrl: String?
    func loadImage(urlStr: String) {
        imageUrl = urlStr
        image = UIImage(named: "placeholder venue")
        if let img = imageCache.object(forKey: NSString(string: imageUrl!)) {
            image = img
            return
        }
        guard let url = URL(string: urlStr) else {return}
        imageUrl = urlStr
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print(err)
            } else {
                DispatchQueue.main.async {
                    let tempImg = UIImage(data: data!)
                    if self.imageUrl == urlStr {
                        self.image = tempImg
                    }
                    imageCache.setObject(tempImg!, forKey: NSString(string: urlStr))
                }
            }
        }.resume()
    }
}
