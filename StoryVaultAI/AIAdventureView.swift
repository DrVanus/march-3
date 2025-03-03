//
//  AIAdventureView.swift
//  StoryVaultAI
//
//  Created by DM on 3/1/25.
//

import SwiftUI

struct AIAdventureBetaView: View {
    let story: String
    @State private var adventureText = ""
    @State private var customChoice = ""
    @State private var isSubscribed = false // Placeholder for subscription status (Vault Master Plan)
    @State private var hasStorytellerPlan = false // Placeholder for Storyteller Plan (unlocks AI images)
    @State private var showVaultMasterPlan = false // For Vault Master Plan modal
    
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
                    
                    // Tailored, Concise, and Engaging Example Text for Alice’s Adventure (Rabbit Hole)
                    Text("""
                        After choosing 'Follow the White Rabbit,' AI generates: 'You spot a curious white rabbit wearing a waistcoat, muttering about being late. Intrigued, you chase it through the garden, tumbling into a deep, dark rabbit hole. Strange objects—books, clocks, and teacups—whirl past, hinting at a bizarre world below. An AI-generated image of the rabbit hole, swirling with surreal colors and shadowy depths, enhances your adventure with vivid visuals and immersive storytelling, drawing you into Alice’s magical journey in Wonderland.'
                        """)
                            .font(.body) // Larger font for better readability
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .background(Color.purple.opacity(0.3))
                            .cornerRadius(10)
                            .lineLimit(nil) // Allow multiple lines for readability
                    
                    // Tailored, Narrower, and Polished Choice Buttons for Alice’s Adventure
                    if isSubscribed {
                        // Chat Interface for Subscribers (Vault Master Plan, Restored, Locked for Non-Subs)
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
                                    adventureText += "\nAI Response: A mysterious figure appears, offering a riddle. [AI-Generated Image available with Storyteller Plan]"
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
                        // Preset Choices for Non-Subscribers (Tailored, Narrower, Polished)
                        HStack(spacing: 15) {  // Increased spacing for better separation
                            Button(action: {
                                adventureText += "\nYou follow the white rabbit..."
                                // Placeholder for AI response
                                adventureText += "\nAI Response: You chase the rabbit into a deep rabbit hole, spotting strange objects swirling around. [AI-Generated Image available with Storyteller Plan]"
                                if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription for custom choices
                                }
                            }) {
                                Text("Follow the White Rabbit")
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
                                adventureText += "\nAI Response: You see a bizarre, shadowy world below, filled with odd shapes. [AI-Generated Image available with Storyteller Plan]"
                                if !isSubscribed {
                                    showVaultMasterPlan = true // Prompt subscription for custom choices
                                }
                            }) {
                                Text("Peek into the Rabbit Hole")
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
                                adventureText += "\nAI Response: The cat’s grin fades into the trees, leaving a trail of riddles. [AI-Generated Image available with Storyteller Plan]"
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
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true) // Hide default back button to avoid duplication
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    // Empty to hide tab bar in this view
                }
            }
            .navigationBarTitle("") // Remove story title from navigation bar to prevent duplication
            .edgesIgnoringSafeArea(.top) // Match the top status bar to the gradient background
            // Custom Back Button (Only One, Functional, Matching Page)
            .navigationBarItems(leading: Button(action: {
                // Handle back action (default navigation pop)
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue.opacity(0.7))
                    .clipShape(Circle())
            })
        }
    }
}

struct AIAdventureBetaView_Previews: PreviewProvider {
    static var previews: some View {
        AIAdventureBetaView(story: "Alice's Adventure in Wonderland")
    }
}
