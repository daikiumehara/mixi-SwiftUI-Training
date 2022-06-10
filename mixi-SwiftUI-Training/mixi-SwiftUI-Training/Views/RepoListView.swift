//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct RepoListView: View {
    private let mockRepos: [Repo] = [
        .mock1, .mock2, .mock3, .mock4, .mock5
    ]
    
    var body: some View {
        NavigationView {
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

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
