//
//  GameCollectionViewCell.swift
//  MyGames
//
//  Created by Frederyk Antunnes on 18/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ivCover: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var console: UILabel!
    
    
    
    func prepare(with game: Game) {
           name.text = game.title ?? ""
           console.text = game.console?.name ?? ""
           if let image = game.cover as? UIImage {
               ivCover.image = image
           } else {
               ivCover.image = UIImage(named: "noCover")
           }
       }
    
}
