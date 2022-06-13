//
//  ReposStore.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/13.
//

import Foundation

@MainActor
class ReposStore: ObservableObject {
    @Published private(set) var state: Stateful<[Repo]> = .idle
    
    func loadRepos() async {
        state = .loading
        
        let result = await GitHubClient.fetchData()
        switch result {
        case .success(let repos):
            state = .loaded(repos)
        case .failure(let error):
            state = .failed(error)
        }
    }
}
