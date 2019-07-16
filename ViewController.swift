//
//  ViewController.swift
//  OmikujiApp
//
//  Created by 山本健太 on 2019/07/15.
//  Copyright © 2019 山本健太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stickView: UIView!

    @IBOutlet weak var stickLabel: UILabel!

    @IBOutlet weak var stickHeight: NSLayoutConstraint!
    
    @IBOutlet weak var stickBottomMargin: NSLayoutConstraint!
    
    @IBOutlet weak var overView: UIView!
    
    @IBOutlet weak var bigLabel: UILabel!
    
    
    
    let resultTexts: [String] = [
        "大吉",
        "中吉",
        "小吉",
        "吉",
        "末吉",
        "凶",
        "大凶"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion != UIEvent.EventSubtype.motionShake || overView.isHidden == false {
            // シェイクモーション以外では動作させない
            return
        }
        
        let resultNum = Int( arc4random_uniform(UInt32(resultTexts.count)) )
        stickLabel.text = resultTexts[resultNum]
        stickBottomMargin.constant = stickHeight.constant * -1
        
        UIView.animate(withDuration: 1, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: { (finished: Bool) in
            self.bigLabel.text = self.stickLabel.text
            self.overView.isHidden = false
        })
    }
    
    @IBAction func tapRetryButton(_ sender: Any) {
        overView.isHidden = true
        stickBottomMargin.constant = 0
    }
    
}

