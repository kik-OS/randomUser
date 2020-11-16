//
//  networkManager.swift
//  randomUser
//
//  Created by Никита Гвоздиков on 15.11.2020.
//

import Foundation


class NetworkManager {
    
    static func generateData() {
        guard let url = URL(string: "https://randomuser.me/api/") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            do {
                let randomUser = try JSONDecoder().decode(Welcome.self, from: data)
                guard let currentUser = randomUser.results?.first else {return}
                MainViewController.currentRandomUser = currentUser
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

        
    
    
    
   
