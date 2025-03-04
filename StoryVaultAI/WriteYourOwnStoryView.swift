//
//  WriteYourOwnStoryView.swift
//  StoryVaultAI
//
//  Created by DM on 2/25/25.
//

import SwiftUI

struct WriteStoryView: View {
    @State private var storyTitle = ""
    @State private var storyGenre = "Fantasy"
    @State private var storyPlot = ""
    @State private var characters = ""
    @State private var settings = ""
    @State private var showAISuggestions = false
    @State private var aiSuggestions = [
        "A magical forest adventure with a wizard",
        "A historical mystery in a haunted castle",
        "A futuristic sci-fi tale on a space station"
    ]
    let genres = ["Fantasy", "Adventure", "Horror/Gothic", "Romance", "Mystery", "Historical Fiction", "Poetry"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color.black]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Text("Write Your Own Story")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                // Story Title
                TextField("Enter Story Title", text: $storyTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                    .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Story Genre
                Picker("Genre", selection: $storyGenre) {
                    ForEach(genres, id: \.self) { genre in
                        Text(genre).tag(genre)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .foregroundColor(.white)
                .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Story Plot (Assisted Input)
                VStack(spacing: 10) {
                    Text("Describe Your Plot (AI can help!)")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    TextEditor(text: $storyPlot)
                        .frame(height: 100)
                        .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                
                // Characters
                VStack(spacing: 10) {
                    Text("Add Characters (e.g., names, roles)")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    TextEditor(text: $characters)
                        .frame(height: 80)
                        .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                
                // Settings
                VStack(spacing: 10) {
                    Text("Describe Settings (e.g., locations, atmosphere)")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    TextEditor(text: $settings)
                        .frame(height: 80)
                        .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                
                HStack(spacing: 10) {
                    Button(action: {
                        print("Save Story: Title=\(storyTitle), Genre=\(storyGenre), Plot=\(storyPlot), Characters=\(characters), Settings=\(settings)") // Placeholder for saving logic
                    }) {
                        Text("Save Story")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(15)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    Button(action: {
                        showAISuggestions = true
                    }) {
                        Text("AI Suggestions")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple.opacity(0.7))
                            .cornerRadius(15)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                
                // AI Suggestions Sheet (Modal)
                .sheet(isPresented: $showAISuggestions) {
                    VStack(spacing: 15) {
                        Text("AI Story Suggestions")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        ForEach(aiSuggestions, id: \.self) { suggestion in
                            Button(action: {
                                storyPlot += "\n\(suggestion)"
                                showAISuggestions = false
                            }) {
                                Text(suggestion)
                                    .padding()
                                    .background(Color.purple.opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        Button("Close") {
                            showAISuggestions = false
                        }
                        .padding()
                        .foregroundColor(.white)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color.black]),
                                              startPoint: .top, endPoint: .bottom))
                }
                
                Spacer()
            }
        }
        .navigationBarTitle("Write Story", displayMode: .inline)
    }
}

struct WriteStoryView_Previews: PreviewProvider {
    static var previews: some View {
        WriteStoryView()
    }
}
