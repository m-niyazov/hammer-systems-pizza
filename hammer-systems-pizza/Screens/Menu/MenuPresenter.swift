//
//  MenuPresenter.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import UIKit

protocol MenuPresentationLogic {
    func fetchDataSuccess(response: MenuModels.Data)
}

final class MenuPresenter: MenuPresentationLogic {
    
    // MARK: - Public Properties
    
    weak var viewController: MenuDisplayLogic?
    
    // MARK: - Presentation Logic
    
    func fetchDataSuccess(response: MenuModels.Data) {
        viewController?.updateBanners(data: response.banners!)
        viewController?.updateCategories(data: response.categories!)
        viewController?.updateMenu(data: response.menu!)
    }
}
