//
//  ThirdScreenView.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import SwiftUI


struct ThirdScreenView: View {
    @Binding var selectedUser: String
    @StateObject var userManager = UserManager()
    @Environment(\.dismiss) var dismiss
    @State private var tappedUserId: Int?
    @State private var refreshTrigger = false // force List re-render

    var body: some View {
        List {
            ForEach(userManager.users) { user in
                HStack(spacing: 16) {
                    // Force reload by using refreshTrigger in the URL
                    AsyncImage(url: URL(string: user.avatar + "?t=\(refreshTrigger.description)")) { image in
                        image.resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }

                    VStack(alignment: .leading) {
                        Text(user.fullName)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer() 
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    selectedUser = user.fullName
                    tappedUserId = user.id
                    dismiss()
                }
                .listRowBackground(tappedUserId == user.id ? Color.gray.opacity(0.2) : Color.clear)
            }

            if userManager.isLoading {
                ProgressView()
            } else if userManager.page <= userManager.totalPages {
                Text("Load more...")
                    .onAppear {
                        userManager.fetchUsers()
                    }
            }
        }
        .refreshable {
            tappedUserId = nil
            refreshTrigger.toggle() // force AsyncImage to reload
            userManager.fetchUsers(reset: true)
        }
        .onAppear {
            if userManager.users.isEmpty {
                userManager.fetchUsers()
            }
        }
        .listStyle(.plain) // Removes extra spacing, keeps full-width divider
        .navigationTitle("Third Screen")
    }
}


struct ThirdScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreenView(selectedUser: .constant("Farih Muhammad"))
    }
}
