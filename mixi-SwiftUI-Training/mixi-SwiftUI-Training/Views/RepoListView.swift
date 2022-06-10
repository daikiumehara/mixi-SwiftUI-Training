//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct RepoListView: View {
    private let mockRepos = [
        Repo(id: 1, name: "Test Repo1", owner: User(name: "Test User1"), description: "This is a good code sample", stargazersCount: 10),
        Repo(id: 2, name: "Test Repo2", owner: User(name: "Test User2"), description: "This is a good code sample", stargazersCount: 10),
        Repo(id: 3, name: "Test Repo3", owner: User(name: "Test User3"), description: "This is a good code sample", stargazersCount: 10),
        Repo(id: 4, name: "Test Repo4", owner: User(name: "Test User4"), description: "This is a good code sample", stargazersCount: 10),
        Repo(id: 5, name: "Test Repo5", owner: User(name: "Test User5"), description: "This is a good code sample", stargazersCount: 10)
    ]
    
    var body: some View {
        NavigationView {
            if mockRepos.isEmpty {
                ProgressView("loading...")
            } else {
                List(mockRepos) { repo in
                    NavigationLink {
                        RepoDetailView(repo: repo)
                    } label: {
                        RepoRow(repo: repo)
                    }
                }
                .navigationTitle("Repositories")
            }
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
