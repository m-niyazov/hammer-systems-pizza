//
//  NetworkWorker.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 10.05.2021.
//

import Foundation

protocol NetworkWorkingLogic {
    func fetchGenericJSONData<T: Decodable>(urlString: String, type: T.Type, response: @escaping(T?) -> Void)
}

final class NetworkWorker: NetworkWorkingLogic {
  
  // MARK: - Private Properties
    
  // MARK: - Working Logic
    func request(urlString: String, completion: @escaping(Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, error)
        }
        
        task.resume()
    }
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, type: T.Type, response: @escaping(T?) -> Void) {
        request(urlString: urlString) { data, error in
            if let error = error {
                print("DEBUG: Request Error \(error.localizedDescription) ")
                return response(nil)
            }
            
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError  {
            print("DEBUG: Failed to decode JSON \(jsonError) ")
            return nil
        }
    }
}
