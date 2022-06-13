//
//  ReposStore.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

@MainActor
class ReposStore: ObservableObject {
    @Published private(set) var repos = [Repo]()
    
    func loadRepos() async {
        let result = await GitHubClient.fetchData()
        switch result {
        case .success(let repos):
            self.repos = repos
        case .failure(let error):
            print(error)
        }
    }
}
