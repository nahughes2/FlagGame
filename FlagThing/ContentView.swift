//
//  ContentView.swift
//  FlagThing
//
//  Created by Nathan Hughes on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number)
                } label: {
                    Image(countries[number])
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = "Wrong"
        
        if number == correctAnswer {
            scoreTitle = "Correct"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
