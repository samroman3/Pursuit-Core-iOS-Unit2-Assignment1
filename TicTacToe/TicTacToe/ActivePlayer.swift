//
//  ActivePlayer.swift
//  ticTacToe
//
//  Created by Sam Roman on 8/5/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit

enum Player {
    case one(String)
    case two(String)
    case draw(String)
    
    
    func whichPlayer(player: Player) -> String{
        
    switch self{
    case .one:
    return "PLAYER ONE WINS"
    case .two:
    return "PLAYER TWO WINS"
    case .draw:
    return "DRAW"
    }
}

}
