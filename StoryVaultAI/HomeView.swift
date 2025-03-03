//
//  HomeView.swift
//  StoryVaultAI
//
//  Created by DM on 2/25/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedStory = "Alice's Adventure in Wonderland"
    let genres = ["Fantasy", "Adventure", "Horror", "Romance", "Mystery", "Historical Fiction", "Poetry"]
    let featuredStories = ["Alice's Adventure in Wonderland", "Mystery of the Lost Kingdom", "Dark Forest Chronicles"] // Placeholder stories for the slider
    
    var body: some View {
        NavigationView {
            ZStack {
                // Full-Screen Gradient Background
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color.black]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    // Larger Book Cover Slider (Carousel)
                    TabView {
                        ForEach(featuredStories, id: \.self) { story in
                            NavigationLink(destination: AIAdventureBetaView(story: story)) {
                                Rectangle()
                                    .fill(Color.blue.opacity(0.7)) // Placeholder for book cover image
                                    .frame(width: 350, height: 525) // Enlarged for prominence (350x525 pixels)
                                    .cornerRadius(15)
                                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                                    .overlay(
                                        Text(story)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                    )
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Show page dots
                    .frame(height: 525)
                    .padding(.horizontal)
                    
                    // AI Adventure Beta Dropdown (Functional)
                    HStack(spacing: 10) {
                        Text("AI Adventure Beta")
                            .font(.headline)
                            .foregroundColor(.white)
                        Menu {
                            Button("Alice's Adventure in Wonderland") {
                                selectedStory = "Alice's Adventure in Wonderland"
                            }
                            Button("New Story Title") {
                                selectedStory = "New Story Title"
                            }
                        } label: {
                            Image(systemName: "chevron.down")
                                .foregroundColor(.blue)
                                .padding(8)
                                .background(Color.blue.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .background(Color(red: 0.1, green: 0.12, blue: 0.24))
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    // Write Your Own Story Button (Purple, Functional)
                    NavigationLink(destination: WriteStoryView()) {
                        Text("Write Your Own Story")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple.opacity(0.7))
                            .cornerRadius(15)
                    }
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    // Genre Slider (Updated to replace Horror/Gothic with Horror)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(genres, id: \.self) { genre in
                                Button(action: {
                                    print("Selected \(genre)") // Placeholder for genre selection logic
                                }) {
                                    Text(genre)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 15)
                                        .background(Color.purple.opacity(0.8))
                                        .cornerRadius(12)
                                }
                                .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true) // Hide default navigation bar if not needed
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
