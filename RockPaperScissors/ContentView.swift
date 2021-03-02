//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Brandon Knox on 3/1/21.
//

import SwiftUI



struct ContentView: View {
    //    Start with a Single View App template, then create a property to store the three possible moves: ["Rock", "Paper", "Scissors"].
    let allMoves = ["Rock", "Paper", "Scissors"]
    
//    You’ll need to create two @State properties to store the app’s current choice and whether the player should win or lose.
    @State var currentChoice = ""
    @State var winOrLose = true
    @State var userScore = 0
    
//    You can use Int.random(in:) to select a random move. You can use it for whether the player should win too if you want, but there’s an even easier choice: Bool.random() is randomly true or false.
    var shouldWin: String {
        winOrLose = Bool.random()
        if winOrLose {
            return "Try to win!"
        } else {
            return "Try to lose!"
        }
    }
    
    var body: some View {
//        Create a VStack showing the player’s score, the app’s move, and whether the player should win or lose. You can use if shouldWin to return one of two different text views.
        VStack {
            Text("Your score: \(userScore)")
            Text(currentChoice)
            Text(shouldWin)
//            The important part is making three buttons that respond to the player’s move: Rock, Paper, or Scissors.
            Spacer()
            ForEach(0 ..< allMoves.count) {
                Button(allMoves[$0]) {
                    appChoice()
                }
            }
        }
    }
    
    func appChoice() {
        currentChoice = allMoves[Int.random(in: 0...2)]
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
