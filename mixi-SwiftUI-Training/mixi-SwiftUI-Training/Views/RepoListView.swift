//
//  ContentView.swift
//  mixi-SwiftUI-Training
//
//  Created by 梅原 奈輝 on 2022/06/10.
//

import SwiftUI

struct RepoListView: View {
    @StateObject private var reposStore = ReposStore()
    
    var body: some View {
        NavigationView {
            if reposStore.repos.isEmpty {
                ProgressView("loading...")
            } else {
                List(reposStore.repos) { repo in
                    NavigationLink {
                        RepoDetailView(repo: repo)
                    } label: {
                        RepoRow(repo: repo)
                    }
                    
                }
                .navigationTitle("Repositories")
            }
        }
        .task {
            await reposStore.loadRepos()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
