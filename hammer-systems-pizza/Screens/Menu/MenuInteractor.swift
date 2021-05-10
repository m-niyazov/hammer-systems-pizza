//
//  MenuInteractor.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import Foundation

protocol MenuBusinessLogic {
    func fetchData()
}

protocol MenuDataStore {
    
}

final class MenuInteractor: MenuBusinessLogic, MenuDataStore {
    // MARK: - Public Properties
    var presenter: MenuPresentationLogic?
    var networkWorker: NetworkWorkingLogic = NetworkWorker()
    // MARK: - Business Logic
    func fetchData() {
        let string = "https://my-json-server.typicode.com/m-niyazov/db-hammer-systems-pizza/data"
        networkWorker.fetchGenericJSONData(urlString: string, type: MenuModels.Data.self) { data in
            guard let data = data else { return }
            self.presenter?.fetchDataSuccess(response: data)
        }
    }
}
