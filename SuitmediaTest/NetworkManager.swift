//
//  NetworkManager.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import Foundation

class UserManager: ObservableObject {
    @Published var users: [User] = []
    @Published var page = 1
    @Published var totalPages = 1
    @Published var isLoading = false
    
    func fetchUsers(reset: Bool = false) {
        guard !isLoading else { return }
        if reset { page = 1; users = [] }
        guard page <= totalPages else { return }
        
        isLoading = true
        let url = URL(string: "https://reqres.in/api/users?page=\(page)&per_page=10")!
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                self.isLoading = false
                guard let data = data else { return }
                if let decoded = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    self.users += decoded.data
                    self.totalPages = decoded.total_pages
                    self.page += 1
                }
            }
        }.resume()
    }
}
