//
//  FirstScreenView.swift
//  SuitmediaTest
//
//  Created by Farih Muhammad on 17/07/2025.
//

import SwiftUI

struct FirstScreenView: View {
    @Binding var name: String
    @Binding var selectedUser: String
    @State private var sentence = ""
    @State private var goNext = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background") // Replace with your asset name
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 12) {
                    Spacer()
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                        .padding(.horizontal)

                    TextField("Palindrome", text: $sentence)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                        .padding(.horizontal)

                    Spacer().frame(height: 12)

                    Button(action: {
                        let clean = sentence.lowercased().replacingOccurrences(of: " ", with: "")
                        let isPalin = clean == String(clean.reversed())
                        showAlert(title: isPalin ? "is a palindrome" : "not palindrome")
                    }) {
                        Text("Check")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(uiColor: UIColor(red: 43/255, green: 99/255, blue: 123/255, alpha: 1)))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    NavigationLink(value: "Second") {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(uiColor: UIColor(red: 43/255, green: 99/255, blue: 123/255, alpha: 1)))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding(.top, 40)
            }
            .navigationDestination(for: String.self) { value in
                if value == "Second" {
                    SecondScreenView(name: $name, selectedUser: $selectedUser)
                }
            }
        }
    }

    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let root = scene.windows.first?.rootViewController {
            root.present(alert, animated: true)
        }
    }
}


struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView(name: .constant("Farih Muhammad"), selectedUser: .constant("John Doe"))
    }
}
