//
//  ViewController.swift
//  ticTacToe
//
//  Created by Sam Roman on 8/1/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //    var brain = TicTacToeBrain()
    let x = UIImage.init(named: "yellowcross")
    let o = UIImage.init(named: "newcircle")
    var playerTurn = true
    var activePlayer = 1
    var turnCount = 0
    var gameState = [0,0,0,
                 0,0,0,
                 0,0,0]
    var winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var playerOnePlays: [Int] = [0,0,0,
                                 0,0,0,
                                 0,0,0]
    var playerTwoPlays: [Int] = [0,0,0,
                                 0,0,0,
                                 0,0,0]
    
    let logic = TicTacToeBrain.init()
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!

    @IBOutlet var buttonOutlets: [UIButton]!
    
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        let outletArr = buttonOutlets
        for i in outletArr! {
            i.setBackgroundImage(nil, for: UIControl.State.normal)
        }
        winnerLabel.text = "Let's Play!"
        gameState = [0,0,0,
                 0,0,0,
                 0,0,0]
        turnCount = 0
        activePlayer = 1
        playerTwoPlays = []
        playerOnePlays = []
        for i in outletArr! {
            i.isEnabled = true
            playAgainButton.isHidden = true
        }
        
    }
    

    
    @IBAction func action(_ sender: AnyObject) {
        if gameState[sender.tag-1] == 0 {
            gameState[sender.tag-1] = (sender.tag-1)
            if activePlayer == 1 {
                buttonOutlets[sender.tag-1].setBackgroundImage(x, for: UIControl.State.normal)
                activePlayer = 2
                winnerLabel.isHidden = false
                winnerLabel.text = "PLAYER TWO TURN"
                turnCount += 1
                playerOnePlays[sender.tag-1] = sender.tag-1
                checkWin(playerArr: playerOnePlays ,playerNum: "ONE")
            } else {
                buttonOutlets[sender.tag-1].setBackgroundImage(o , for: UIControl.State.normal)
                activePlayer = 1
                winnerLabel.isHidden = false
                winnerLabel.text = "PLAYER ONE TURN"
                turnCount += 1
                playerTwoPlays[sender.tag-1] = sender.tag-1
                checkWin(playerArr: playerTwoPlays, playerNum: "TWO")
            }
        }
    }
    //                checkWin(playerArr: playerTwoPlays, playerNum: "TWO", label: winLabel, outletArr: outletArr, playButton: playButton)
    
    
    //        brain.actionLogic(label: winnerLabel, outletArr: arr, sender: sender, playButton: playAgainButton, winLabel: winnerLabel)
    
    
    
    //found out why check win doesnt work if player goes more than 3 times.
    //checkwin only checks if playerarray has 3 elements in array that match wining combos, if player doesnt win in 4 moves then it waits for a draw
    //need to find how to append first three elements of sorted playerarray and compare that to wining combos to determine winner if turn count is over 4
    //try the switch case but use .contains on playerarrays for the first three
    
    func checkWin(playerArr: [Int],playerNum: String){
        let sorted = playerArr.sorted()
        var check: [Int] = []
        if turnCount >= 5 {
            check.append(contentsOf: sorted[0...2])
            for i in winningCombos {
                if check == i {
                    winnerLabel.text = "PLAYER \(playerNum) WINS!"
                    playAgainButton.isHidden = false
                    disableAll()
                    }
                }
            }
        }

    
   
    func disableAll () {
        for i in buttonOutlets {
            i.isEnabled = false
    }
    }

    
    
    
    
    
    
    
    //instead of checking if player moves are equal to winning combos create array of sender tags to see if they match wining combos after each turn.
    // switch case to check if playerarray.sorted is
    
    
    
    
    
    override func viewDidLoad() {
        winnerLabel.text = "Let's Play!"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}





