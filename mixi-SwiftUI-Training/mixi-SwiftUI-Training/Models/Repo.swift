//
//  Repo.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/11.
//

import Foundation

struct Repo: Identifiable, Decodable {
    let id: Int
    let name: String
    let owner: User
    let description: String?
    let stargazersCount: Int
}
