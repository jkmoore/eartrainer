//
//  SettingViewController.swift
//  Ear Trainer
//
//  Created by Kai Moore on 12/20/18.
//  Copyright © 2018 Kai Moore. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var mainController: ViewController!
    var inSeqMode = true //true if in sequence mode, false if in chord mode
    var numNotes = 0 //number of notes in the sequence or chord
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //create gradient background
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red:0.48, green:0.66, blue:0.92, alpha:1.0).cgColor, UIColor(red:0.26, green:0.59, blue:0.89, alpha:1.0).cgColor]
        view.layer.insertSublayer(layer, at: 0) //insert at the bottom
        
        //tailor question to the selected mode
        if inSeqMode == true {
            questionLabel.text = "How many notes per sequence?"
        }
        else {
            questionLabel.text = "How many notes per chord?"
        }
    }
    
    @IBAction func didTap1(_ sender: Any) {numNotes = 1}
    @IBAction func didTap2(_ sender: Any) {numNotes = 2}
    @IBAction func didTap3(_ sender: Any) {numNotes = 3}
    @IBAction func didTap4(_ sender: Any) {numNotes = 4}
    @IBAction func didTap5(_ sender: Any) {numNotes = 5}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainController = segue.destination as! ViewController
        mainController.inSeqMode = inSeqMode
        mainController.numNotes = numNotes
    }
}
