//
//  PlayerViewController.swift
//  Music Player
//
//  Created by AKANKSHA on 29/05/24.
//

import UIKit

class PlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 1{
            configure()
        }
    }
    
    func configure(){
        
    }

    

   

}
