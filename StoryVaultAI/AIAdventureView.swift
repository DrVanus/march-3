//
//  AIAdventureView.swift
//  StoryVaultAI
//
//  Created by DM on 3/1/25.
//

//
//  AIAdventureView.swift
//  StoryVaultAI
//
//  Created by DM on 3/1/25.
//

import SwiftUI

// Main View for Interactive AI Adventures
struct AIAdventureBetaView: View {
    let story: String
    @State private var adventureText: String = ""
    @State private var customChoice: String = ""
    @State private var isSubscribed: Bool = false // Placeholder for Vault Master Plan (unlocks custom chat)
    @State private var hasStorytellerPlan: Bool = false // Placeholder for Storyteller Plan (unlocks AI images)
    @State private var showVaultMasterPlan: Bool = false // For Vault Master Plan modal
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.3), Color.black]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 25) {  // Increased spacing for a polished, launch-ready look
                    // Single, Readable, and Professional Story Title (Centered, No Duplication)
                    Text(story)
                        .font(.largeTitle)  // Increased font size for prominence
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.top, 60)  // Increased top padding for readability and gradient match
                    
                    // AI-Generated Image Placeholder (Unlocked by Storyteller Plan)
                    if hasStorytellerPlan {
                        ZStack {
                            Rectangle()
                                .fill(Color.blue.opacity(0.7)) // Placeholder for AI-generated image
                                .frame(width: 350, height: 250) // Maintained for prominence
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Text("AI-Generated Scene")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                    } else {
                        ZStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.5)) // Locked state
                                .frame(width: 350, height: 250)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Text("AI-Generated Scene Locked")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                            
                            Button(action: {
                                print("Subscribe to Storyteller Plan for AI Images")
                                // Placeholder for subscription logic
                            }) {
                                Text("Storyteller Plan - Unlock AI-Generated Photos")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.purple.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
                            }
                            .position(x: 175, y: 220) // Position button centrally at the bottom of the image
                        }
                    }
                    
                    // Engaging Introduction or Response Text for Alice’s Adventure
                    if adventureText.isEmpty {
                        // Initial introduction leading to user choices
                        Text("""
                            Welcome to Wonderland! You find yourself in a quiet garden, the sun dipping low in the sky, when a peculiar sight catches your eye—a white rabbit wearing a waistcoat dashes past, muttering anxiously about being late. Intrigued by this strange creature, you hesitate, feeling the pull of adventure. What will you do as the rabbit disappears into the shadows?
                            """)
                            .font(.body) // Larger font for better readability
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .background(Color.purple.opacity(0.3))
                            .cornerRadius(10)
                            .lineLimit(nil) // Allow multiple lines for readability
                    } else {
                        // Response text after a choice, immersive and leading to new options
                        Text(adventureText)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .background(Color.purple.opacity(0.3))
                            .cornerRadius(10)
                            .lineLimit(nil)
                    }
                    
                    // Tailored, Narrower, and Polished Choice Buttons or Chat for Alice’s Adventure
                    if isSubscribed {
                        // Chat Interface for Subscribers (Vault Master Plan, Enhanced with Custom Input)
                        VStack(spacing: 10) {
                            TextField("Craft your unique adventure path...", text: $customChoice)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(.white)
                                .background(Color(red: 0.1, green: 0.12, blue: 0.24).opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 20)
                                .disabled(!isSubscribed) // Lock for non-subscribers
                                .overlay(
                                    !isSubscribed ? Text("Subscribe to Vault Master Plan to Unlock")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .padding(4)
                                        .background(Color.blue.opacity(0.7))
                                        .cornerRadius(5) : nil,
                                    alignment: .center
                                )
                            
                            Button(action: {
                                if isSubscribed && !customChoice.isEmpty {
                                    adventureText += "\nYou chose: \(customChoice)"
                                    // Placeholder for AI response and image generation (if Storyteller Plan is active)
                                    adventureText += "\nAI Response: A mysterious figure appears, whispering a riddle about a hidden path in Wonderland. The White Rabbit pauses, watching you closely—what’s your next move?"
                                    customChoice = ""
                                } else if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription
                                }
                            }) {
                                Text("Submit Your Path")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.purple.opacity(0.7))
                                    .cornerRadius(15)
                            }
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            .disabled(!isSubscribed) // Lock for non-subscribers
                            .overlay(
                                !isSubscribed ? Text("Subscribe to Unlock")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.blue.opacity(0.7))
                                    .cornerRadius(5) : nil,
                                alignment: .center
                            )
                        }
                        .padding(.horizontal)
                    } else {
                        // Preset Choices for Non-Subscribers (Tailored, Narrower, Polished, Title Case)
                        HStack(spacing: 15) {  // Increased spacing for better separation
                            Button(action: {
                                adventureText += "\nYou follow the white rabbit..."
                                // Placeholder for AI response
                                adventureText += "\nAI Response: You chase the rabbit into a deep, dark rabbit hole, where strange objects—books, clocks, and teacups—swirl past, hinting at a bizarre world below. An AI-generated image could reveal more with the Storyteller Plan—what will you do next?"
                                if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription for custom choices
                                }
                            }) {
                                Text("Follow the white rabbit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 12)  // Reduced horizontal padding for narrower buttons
                                    .background(Color.purple.opacity(0.7))
                                    .cornerRadius(15)
                            }
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Button(action: {
                                adventureText += "\nYou peek into the rabbit hole..."
                                // Placeholder for AI response
                                adventureText += "\nAI Response: You peer cautiously into the rabbit hole, glimpsing swirling colors and shadowy figures below. A cold breeze brushes your face—what path will you take from here?"
                                if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription for custom choices
                                }
                            }) {
                                Text("Peek into the rabbit hole")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 12)  // Reduced horizontal padding for narrower buttons
                                    .background(Color.purple.opacity(0.7))
                                    .cornerRadius(15)
                            }
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Button(action: {
                                adventureText += "\nYou chase the Cheshire Cat..."
                                // Placeholder for AI response
                                adventureText += "\nAI Response: The Cheshire Cat’s grin flickers in the distance, leading you into a forest of riddles. Its voice echoes softly—what mystery will you uncover next?"
                                if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription for custom choices
                                }
                            }) {
                                Text("Chase the Cheshire Cat")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 12)  // Reduced horizontal padding for narrower buttons
                                    .background(Color.purple.opacity(0.7))
                                    .cornerRadius(15)
                            }
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                    }
                    
                    // AI Chat Bar (Locked behind Vault Master Plan, Always at Bottom)
                    if isSubscribed {
                        AIChatBar(text: $customChoice) { response in
                            handleCustomResponse(response)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    } else {
                        LockedContentView(planName: "Vault Master Plan", feature: "Custom AI Responses")
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(false) // Show the default `< Back` button (functional)
            .navigationBarTitle("") // Remove navigation title to prevent duplication
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    // Empty to hide tab bar in this view
                }
            }
            .edgesIgnoringSafeArea(.top) // Match the top status bar to the gradient background
            .navigationBarItems(leading: EmptyView()) // Remove the custom chevron back button to avoid duplication
            .sheet(isPresented: $showVaultMasterPlan) {
                // Placeholder for Vault Master Plan subscription modal
                Text("Subscribe to Vault Master Plan for custom responses!")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(15)
            }
        }
    }
    
    // Handle custom AI responses from the chat bar
    private func handleCustomResponse(_ response: String) {
        guard !response.isEmpty, isSubscribed else { return }
        
        adventureText += "\nYou said: '\(response)'. The AI responds: 'A magical twist unfolds in Wonderland, as the White Rabbit pauses, intrigued by your words, leading you deeper into a world of riddles and surprises...'"
        // Placeholder for AI response and image generation (if Storyteller Plan is active)
        if hasStorytellerPlan {
            adventureText += " [AI-Generated Image updated with new scene]"
        }
        customChoice = "" // Clear the input after processing
    }
}

// Reusable AI Chat Bar Component
struct AIChatBar: View {
    @Binding var text: String
    var onSubmit: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Type your response...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.white)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button(action: {
                onSubmit(text)
                text = ""
            }) {
                Text("Send")
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .background(Color.purple)
                    .cornerRadius(10)
                    .shadow(color: .purple.opacity(0.5), radius: 3, x: 0, y: 2)
            }
        }
        .padding(.horizontal)
        .background(Color.black.opacity(0.8))
    }
}

// Reusable Locked Content View
struct LockedContentView: View {
    let planName: String
    let feature: String
    
    var body: some View {
        Text("Locked - Upgrade to \(planName) to Unlock \(feature)")
            .font(.caption2)
            .foregroundColor(.white)
            .padding(8)
            .background(Color.blue.opacity(0.7))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
    }
}

struct AIAdventureBetaView_Previews: PreviewProvider {
    static var previews: some View {
        AIAdventureBetaView(story: "Alice's Adventure in Wonderland")
    }
}
