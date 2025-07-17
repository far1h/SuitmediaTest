//
//  Models.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
    var fullName: String { "\(first_name) \(last_name)" }
}

struct UserResponse: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
}
