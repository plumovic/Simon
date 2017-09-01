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
    @IBOutlet weak var colorsFrame: UIView!
    @IBOutlet var colorDisplays: [UIView]!
    @IBOutlet weak var messageLabel: UILabel!
    
    var pattern = [Int]()
    var timer = Timer()
    var index = 0
    var playerTurn = false
    var gameOver = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pattern.append(0)
        pattern.append(1)
        pattern.append(2)
        pattern.append(3)
    }

    func flashColor(number: Int)
    {
        UIView.transition(with: colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorDisplays[number].alpha = 1.0
        }) { (true) in
            UIView.transition(with: self.colorDisplays[number], duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorDisplays[number].alpha = 0.4
            }, completion: nil)
        }
    }
    
    func displayPattern()
    {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.nextColor), userInfo: nil, repeats: true)
    }
    
    @objc func nextColor()
    {
        Int(arc4random_uniform(4))
    }
    
    @IBAction func onStartButtonPressed(_ sender: Any)
    {
        
    }
    @IBAction func onColorTapped(_ sender: UITapGestureRecognizer)
    {
        for number in 0..<colorDisplays.count
        {
            if colorDisplays[number].frame.contains(sender.location(in: colorsFrame))
            {
                flashColor(number: number)

            }
        }
    }
}
