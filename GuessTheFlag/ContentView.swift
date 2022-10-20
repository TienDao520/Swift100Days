//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tien Dao on 2022-10-18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    ///In order for this game to be fun, we need to randomize the order in which flags are shown, trigger an alert telling them whether they were right or wrong whenever they tap a flag, then reshuffle the flags.
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var endGame = false
    @State private var questionAsked = 0
    
    ///Views and modifiers: Wrap up: Challenge 2
    ///replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.
    struct FlagImage: View {
        let country: String
        
        init(of country: String) {
            self.country = country
        }
        
        var body: some View {
            Image(country)
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
                .shadow(color: .black, radius: 2)
        }
    }
    

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 180, endRadius: 450)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack (spacing: 20) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))

                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            FlagImage(of: countries[number])

                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
        }
            .alert("Gameover", isPresented: $endGame) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your final score is \(score)")
            }
            .alert(scoreTitle, isPresented:  $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your current score is \(score)")
            }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1

        } else {
            scoreTitle = "Wrong"
            score -= 1

        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionAsked += 1
        if questionAsked == 8 {
            endGame = true
            showingScore = false
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
