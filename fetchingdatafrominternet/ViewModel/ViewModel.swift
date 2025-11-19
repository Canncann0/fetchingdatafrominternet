//
//  ViewModel.swift
//  fetchingdatafrominternet
//
//  Created by Dogancan turgut on 19.11.2025.
//

import Foundation


class ViewModel: ObservableObject {
    
    @Published var users = [UserModel]()
    
    
    func loadUser() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { fetchedData, response, error in
            
            guard let data = fetchedData  else { return }
            
            do {
                
                let decodeFetchedData = try JSONDecoder().decode([UserModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.users = decodeFetchedData
                }
                
            } catch let error {
                print(error)
            }
            
        }
        .resume()
    }
    
}
