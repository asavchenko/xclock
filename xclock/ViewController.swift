//
//  ViewController.swift
//  xclock
//
//  Created by Alexey Savchenko on 5/18/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import SpriteKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }
}
