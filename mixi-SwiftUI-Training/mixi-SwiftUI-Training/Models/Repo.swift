//
//  Repo.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import Foundation

struct Repo: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var owner: User
    var description: String?
    var stargazersCount: Int
    
    static func == (lhs: Repo, rhs: Repo) -> Bool {
        lhs.id == rhs.id
    }
}
