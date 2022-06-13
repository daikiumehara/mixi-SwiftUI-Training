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
    @Published private(set) var error: APIError?
    @Published private(set) var isLoading: Bool = false
    
    func loadRepos() async {
        isLoading = true
        let result = await GitHubClient.fetchData()
        switch result {
        case .success(let repos):
            self.repos = repos
            error = nil
        case .failure(let error):
            self.error = error
        }
        isLoading = false
    }
}
