//
//  RepoRepository.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/15.
//

import Foundation

protocol RepoRepository {
    func fetchRepos() async -> Result<[Repo], APIError>
}

struct RepoRepositoryImpl: RepoRepository {
    private let githubClient: GitHubClient
    
    init(githubClient: GitHubClient) {
        self.githubClient = githubClient
    }
    
    func fetchRepos() async -> Result<[Repo], APIError> {
        await githubClient.fetchData()
    }
}
