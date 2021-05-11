//
//  MenuModels.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import UIKit

enum MenuModels {
    
    // MARK: - Models
    struct Data: Decodable {
        var menu: [Meal]?
        var categories: [Category]?
        var banners: [Banner]?
    }
    
    struct Meal: Decodable {
        let id: Int
        let name: String
        let description: String
        let priceFrom: Int
        let categoryId: Int
        let categoryName: String
        let image: String
    }
    
    struct Category: Decodable {
        let id: Int
        let name: String
    }
    
    struct Banner: Decodable {
        let id: Int
        let image: String
    }
    
}
