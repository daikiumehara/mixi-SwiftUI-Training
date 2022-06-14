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
            if reposStore.isLoading {
                ProgressView("loading...")
            } else {
                VStack {
                    if reposStore.error == nil {
                        if reposStore.repos.isEmpty {
                            Text("No repositories")
                                .bold()
                                .task {
                                    await reposStore.loadRepos()
                                }
                        } else {
                            List(reposStore.repos) { repo in
                                NavigationLink {
                                    RepoDetailView(repo: repo)
                                } label: {
                                    RepoRow(repo: repo)
                                }
                            }
                        }
                    } else {
                        ErrorView {
                            Task {
                                await self.reposStore.loadRepos()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Repositories")
        .onAppear {
            loadRepos()
        }
    }
}
        
        struct RepoListView_Previews: PreviewProvider {
            static var previews: some View {
                RepoListView()
            }
        }
