//
//  NetworkManager.swift
//  Rick&Morty
//
//  Created by Kirill Khristenko on 28.04.2022.
//

import Foundation
import UIKit


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with complition: @escaping (RickAndMorty) -> Void) {
        guard let stringUrl = url else { return }
        guard let url = URL(string: stringUrl) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "Localized description is empty")
                return
            }
            print(response)
            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    complition(rickAndMorty)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

class ImageManager {
    
    static var shared = ImageManager()
    
    func fetchImage(from url: URL, with completion: @escaping (Data) -> Void) {
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Localized description is empty")
                return
            }
            completion(data)
        }.resume()
    }
}
