//
//  Guesser.swift
//  GuesserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Guesser{
    
    private var correctAnswer:Int
    private var  _numAttempts:Int
    private var guesses: [Guess]
    
    struct Guess {
        var correctAnswer:Int
        var numAttemptsRequired:Int
    }
    
    var numAttempts:Int{
        return _numAttempts
    }
    
    static var shared = Guesser()
    
    private init(){
        self.correctAnswer = 0
        self._numAttempts = 0
        self.guesses = []
    }
    
    init(correctAnswer:Int, _numAttempts:Int, guesses: [Guess]){
        self.correctAnswer = correctAnswer
        self._numAttempts = _numAttempts
        self.guesses = guesses
    }
    
   
    
    func createNewProblem(){
        correctAnswer = Int.random(in: 1...10)
        _numAttempts = 0
    }
    
    func amIRight(guess:Int) -> Result{
        _numAttempts = _numAttempts + 1
        if guess < correctAnswer {
            return Result.tooLow
        }
        else if guess > correctAnswer{
            return Result.tooHigh
        }
        else {
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct
        }
    }
    
    func guess(index:Int) -> Guess{
      return guesses[index]
    }
    
    
    func numGuesses() -> Int{
        return guesses.count
    }
    
    func clearStatistics(){
        guesses = []
    }
    
    func minimumNumAttempts() -> Int{
        
        if guesses.isEmpty {
          return 0
        }
        else{
       var  minValue = guesses[0].numAttemptsRequired
        for i in guesses{
            if minValue > i.numAttemptsRequired {
                minValue = i.numAttemptsRequired
            }
        }
             return minValue
        }
        
    }
    
    func maximumNumAttempts() -> Int{
        if guesses.isEmpty{
            return 0
        }
        else{
        var maxValue = guesses[0].numAttemptsRequired
        for i in guesses{
            if maxValue < i.numAttemptsRequired {
                maxValue = i.numAttemptsRequired
            }
        }
            return maxValue
        }
        
    }

}
enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}
