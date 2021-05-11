//
//  MenuViewController.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
    func updateBanners(data: [MenuModels.Banner])
    func updateCategories(data: [MenuModels.Category])
    func updateMenu(data: [MenuModels.Meal])
}

final class MenuViewController: UIViewController {
    
    // MARK: - Public Properties
    
    var interactor: MenuBusinessLogic?
    var router: (MenuRoutingLogic & MenuDataPassing)?
    
    lazy var contentView: MenuViewLogic = MenuView()
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        dataRequest()
    }
    
    // MARK: - Requests
    func dataRequest() {
        interactor?.fetchData()
    }
    
    // MARK: - Private Methods
    private func configure() {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.barTintColor = .lightGrayBackground
         navigationBar?.isTranslucent = false
        navigationBar?.shadowImage = UIImage()
        let leftBarButton = chooseLocationBarButton("Москва")
        leftBarButton.addTarget(self, action: #selector(handleChooseLocationBarButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
    }
    
    // MARK: - UI Actions
    @objc func handleChooseLocationBarButton () {
        print("DEBUG: handleChooseLocationBarButton ")
    }
    
}

// MARK: - Display Logic
extension MenuViewController: MenuDisplayLogic {
    
    func updateBanners(data: [MenuModels.Banner]) {
        contentView.updateBanners(data: data)
    }
    
    func updateCategories(data: [MenuModels.Category]) {
        contentView.updateCategories(data: data)
    }
    
    func updateMenu(data: [MenuModels.Meal]) {
        contentView.updateMenu(data: data)
    }
}

// Supported Views For ViewController
extension MenuViewController {
    func chooseLocationBarButton(_ locationString: String) -> UIButton {
        let button = UIButton(type: .system)
        let icon = UIImage(named: "arrow-down")!
        icon.withTintColor(.black)
        button.setTitle(locationString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: -10)
        button.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
}
