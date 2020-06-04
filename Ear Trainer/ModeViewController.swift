//
//  ModeViewController.swift
//  Ear Trainer
//
//  Created by Kai Moore on 12/20/18.
//  Copyright © 2018 Kai Moore. All rights reserved.
//

import UIKit

class ModeViewController: UIViewController {
    
    var settingController: SettingViewController!
    var inSeqMode = true //true if in sequence mode, false if in chord mode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create gradient background
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red:0.48, green:0.66, blue:0.92, alpha:1.0).cgColor, UIColor(red:0.26, green:0.59, blue:0.89, alpha:1.0).cgColor]
        view.layer.insertSublayer(layer, at: 0) //insert at the bottom
    }
    
    @IBAction func didTapSeq(_ sender: Any) {
        //inSeqMode = true
    }
    
    @IBAction func didTapChord(_ sender: Any) {
        inSeqMode = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let settingController = segue.destination as! SettingViewController
        settingController.inSeqMode = inSeqMode
    }
}
