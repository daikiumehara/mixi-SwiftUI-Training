//
//  RepoListViewModel.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/15.
//

import Foundation

@MainActor
final class RepoListViewModel: ObservableObject {
    @Published private(set) var state: Stateful<[Repo]> = .idle
    
    func onAppear() {
        loadRepos()
    }
    
    func onRetryButtonTapped() {
        loadRepos()
    }
    
    private func loadRepos() {
        Task {
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
}
