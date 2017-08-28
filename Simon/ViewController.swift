//
//  ViewController.swift
//  Simon
//
//  Created by plumovic on 8/24/17.
//  Copyright © 2017 plumovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var colorDisplays: [UIView]!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    func changeColor(number: Int)
    {
        UIView.transition(with: colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorDisplays[number].alpha = 1.0
        }) { (true) in
            UIView.transition(with: self.colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorDisplays[number].alpha = 0.4
            }, completion: nil)
        }
    }
    
    @IBAction func onStartButtonPressed(_ sender: Any)
    {
        
    }
}
