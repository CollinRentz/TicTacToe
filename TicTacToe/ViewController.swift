//
//  ViewController.swift
//  TicTacToe
//
//  Created by Collin Rentz on 2/21/23.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
        case x
        case o
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.x
    var currentTurn = Turn.x
    
    var X = "X"
    var O = "O"
    var board = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBoard()
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        if(fullBoard()) {
             resultAlert(title:  "Draw")
        }
    }
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        } ))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.o {
            firstTurn = Turn.x
            turnLabel.text = X
        }
        else if firstTurn == Turn.x {
            firstTurn = Turn.o
            turnLabel.text = O
        }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for:  .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil) {
            if(currentTurn == Turn.o) {
                sender.setTitle(O, for: .normal)
                currentTurn = Turn.x
                turnLabel.text = X
            }
            else if(currentTurn == Turn.x) {
                sender.setTitle(X, for: .normal)
                currentTurn = Turn.o
                turnLabel.text = O
            }
            sender.isEnabled = false
        }
    }
    
}

