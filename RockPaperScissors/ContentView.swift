//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Brandon Knox on 3/1/21.
//

import SwiftUI

struct GameButton: View {
    var icon: String
    
    init(icon: String) {
        self.icon = icon
    }
    
    var body: some View {
        Image(self.icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color .black, lineWidth: 1))
    }
}

struct ContentView: View {

    @State private var allMoves = ["Rock", "Paper", "Scissors"]
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var userScore = 0
    @State private var turn = 1
    @State private var showingScore = false
    
    var body: some View {
        VStack {
            GameButton(icon: allMoves[currentChoice])
            Text(winOrLose())
                .font(.largeTitle)
            ForEach(0 ..< 3) { number in
                Button(action: { userCheck(number) }) {
                    GameButton(icon: self.allMoves[number])
                 }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Game Complete!"),
                  message: Text("Your score is \(userScore)"),
                  dismissButton: .default(Text("Continue")){ userScore = 0 })
        }
    }

    func winOrLose() -> String {
        if shouldWin {
            return "Try to win!"
        } else {
            return "Try to lose!"
        }
    }
    
    func userCheck(_ number: Int) {
        // get user choice
        let userChoice = allMoves[number]
        let challengeChoice = allMoves[currentChoice]
        var win = false
        switch (challengeChoice) {
        case "Rock":
            if userChoice == "Paper" {
                win = true
            } else {
                win = false
            }
        case "Paper":
            if userChoice == "Scissors" {
                win = true
            } else {
                win = false
            }
        case "Scissors":
            if userChoice == "Rock" {
                win = true
            } else {
                win = false
            }
        default:
            win = false
        }
        if shouldWin && win {
            userScore += 1
        } else if (shouldWin == false && win == false) {
            userScore += 1
        } else {
            userScore -= 1
        }
        currentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        turn += 1
        if turn > 10 {
            showingScore = true
            turn = 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
