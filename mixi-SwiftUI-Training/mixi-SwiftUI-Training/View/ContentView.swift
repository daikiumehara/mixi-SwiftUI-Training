//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    private let mockRepos = [
        Repo(id: 1, name: "Test Repo1", owner: User(name: "Test User1"), description: "This is a gool code sample", stargazersCount: 10),
        Repo(id: 2, name: "Test Repo2", owner: User(name: "Test User2"), description: "This is a gool code sample", stargazersCount: 10),
        Repo(id: 3, name: "Test Repo3", owner: User(name: "Test User3"), description: "This is a gool code sample", stargazersCount: 10),
        Repo(id: 4, name: "Test Repo4", owner: User(name: "Test User4"), description: "This is a gool code sample", stargazersCount: 10),
        Repo(id: 5, name: "Test Repo5", owner: User(name: "Test User5"), description: "This is a gool code sample", stargazersCount: 10)
    ]
    
    var body: some View {
        List(mockRepos) { repo in
            RepoRow(repo: repo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
