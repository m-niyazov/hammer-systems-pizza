//
//  MenuRouter.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import UIKit

protocol MenuRoutingLogic {

}

protocol MenuDataPassing {
  var dataStore: MenuDataStore? { get }
}

final class MenuRouter: MenuRoutingLogic, MenuDataPassing {

  // MARK: - Public Properties

  weak var parentController: UIViewController?
  weak var viewController: MenuViewController?
  var dataStore: MenuDataStore?

  // MARK: - Navigation
  

  // MARK: - Passing data
  
  //
}
