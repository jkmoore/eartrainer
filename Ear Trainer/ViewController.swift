//
//  ViewController.swift
//  Ear Trainer
//
//  Created by Kai Moore on 12/18/18.
//  Copyright © 2018 Kai Moore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var cSharpButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var dSharpButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var fSharpButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var gSharpButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var aSharpButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    
    @IBOutlet weak var answerLabel1: UILabel!
    @IBOutlet weak var answerLabel2: UILabel!
    @IBOutlet weak var answerLabel3: UILabel!
    @IBOutlet weak var answerLabel4: UILabel!
    @IBOutlet weak var answerLabel5: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var notes: [UIButton] = [] //contains note buttons
    var answers: [UILabel] = [] //contains answer labels
    
    var inSeqMode = true //true if in sequence mode, false if in chord mode
    var prevAnsWrong = false //clears answers upon pressing any note
    var numNotes = 1 //number of notes in the sequence or chord
    var playlist: [String] = [] //list of note sound files to play
    var correctNotes: [String] = [] //list of correct notes
    var ansNumber = 1 //tracks number of notes input by the user
    
    //score information displayed to the user
    var points = 0.0 //number of fully correct answers given by the user
    var tries = 0.0 //number of attempts at full answers given by the user
    var percentage = 0.0 //points / tries * 100
    
    var hasNotAnswered = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //create gradient background
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red:0.48, green:0.66, blue:0.92, alpha:1.0).cgColor, UIColor(red:0.26, green:0.59, blue:0.89, alpha:1.0).cgColor]
        view.layer.insertSublayer(layer, at: 0) //insert at the bottom
        
        answers = [answerLabel1, answerLabel2, answerLabel3, answerLabel4, answerLabel5]
        
        reset()
    }
    
    func setButton(button: UIButton, title: String, enable: Bool) {
        button.isEnabled = enable
        button.setTitle(title, for: .normal)
        
    }
    
    func reset() {
        generateNotes()
        setButton(button: nextButton, title: "", enable: false)
        setButton(button: playButton, title: "Play", enable: true)
        setNoteButtons(enable: false)
        clearAnswers()
    }
    
    //randomly generates note(s) and adds to playlist and correctNotes
    func generateNotes() {
        
        playlist = []
        correctNotes = []
        
        for _ in 0...numNotes-1 {
            
            let number = Int.random(in: 0...47)
            
            switch number {
            case 0:
                playlist.append("C2")
                correctNotes.append("C")
            case 1:
                playlist.append("C#2")
                correctNotes.append("C#")
            case 2:
                playlist.append("D2")
                correctNotes.append("D")
            case 3:
                playlist.append("D#2")
                correctNotes.append("D#")
            case 4:
                playlist.append("E2")
                correctNotes.append("E")
            case 5:
                playlist.append("F2")
                correctNotes.append("F")
            case 6:
                playlist.append("F#2")
                correctNotes.append("F#")
            case 7:
                playlist.append("G2")
                correctNotes.append("G")
            case 8:
                playlist.append("G#2")
                correctNotes.append("G#")
            case 9:
                playlist.append("A2")
                correctNotes.append("A")
            case 10:
                playlist.append("A#2")
                correctNotes.append("A#")
            case 11:
                playlist.append("B2")
                correctNotes.append("B")
            case 12:
                playlist.append("C3")
                correctNotes.append("C")
            case 13:
                playlist.append("C#3")
                correctNotes.append("C#")
            case 14:
                playlist.append("D3")
                correctNotes.append("D")
            case 15:
                playlist.append("D#3")
                correctNotes.append("D#")
            case 16:
                playlist.append("E3")
                correctNotes.append("E")
            case 17:
                playlist.append("F3")
                correctNotes.append("F")
            case 18:
                playlist.append("F#3")
                correctNotes.append("F#")
            case 19:
                playlist.append("G3")
                correctNotes.append("G")
            case 20:
                playlist.append("G#3")
                correctNotes.append("G#")
            case 21:
                playlist.append("A3")
                correctNotes.append("A")
            case 22:
                playlist.append("A#3")
                correctNotes.append("A#")
            case 23:
                playlist.append("B3")
                correctNotes.append("B")
            case 24:
                playlist.append("C4")
                correctNotes.append("C")
            case 25:
                playlist.append("C#4")
                correctNotes.append("C#")
            case 26:
                playlist.append("D4")
                correctNotes.append("D")
            case 27:
                playlist.append("D#4")
                correctNotes.append("D#")
            case 28:
                playlist.append("E4")
                correctNotes.append("E")
            case 29:
                playlist.append("F4")
                correctNotes.append("F")
            case 30:
                playlist.append("F#4")
                correctNotes.append("F#")
            case 31:
                playlist.append("G4")
                correctNotes.append("G")
            case 32:
                playlist.append("G#4")
                correctNotes.append("G#")
            case 33:
                playlist.append("A4")
                correctNotes.append("A")
            case 34:
                playlist.append("A#4")
                correctNotes.append("A#")
            case 35:
                playlist.append("B4")
                correctNotes.append("B")
            case 36:
                playlist.append("C5")
                correctNotes.append("C")
            case 37:
                playlist.append("C#5")
                correctNotes.append("C#")
            case 38:
                playlist.append("D5")
                correctNotes.append("D")
            case 39:
                playlist.append("D#5")
                correctNotes.append("D#")
            case 40:
                playlist.append("E5")
                correctNotes.append("E")
            case 41:
                playlist.append("F5")
                correctNotes.append("F")
            case 42:
                playlist.append("F#5")
                correctNotes.append("F#")
            case 43:
                playlist.append("G5")
                correctNotes.append("G")
            case 44:
                playlist.append("G#5")
                correctNotes.append("G#")
            case 45:
                playlist.append("A5")
                correctNotes.append("A")
            case 46:
                playlist.append("A#5")
                correctNotes.append("A#")
            case 47:
                playlist.append("B5")
                correctNotes.append("B")
            default:
                break
            }
        }
        
        if duplicateFound(list: playlist) {
            generateNotes()
        }
    }
    
    //returns true if a duplicate note name is found in the list
    func duplicateFound(list: [String]) -> Bool {

        var found = false
        var foundCount = 0
        
        for item in list {
            for item2 in list {
                foundCount = 0
                if item == item2 {
                    foundCount += 1
                }
                if foundCount > 1 {
                    found = true
                }
            }
        }

        return found
    }
    
    //switches state of next button (between enabled/disabled)
    func flipNextButton() {
        
        if nextButton.isEnabled {
            nextButton.setTitle("", for: .normal)
            nextButton.isEnabled = false
        }
        
        else {
            nextButton.setTitle("Skip", for: .normal)
            nextButton.isEnabled = true
        }
    }
    
    //switches state of play button (between enabled/disabled)
    func flipPlayButton() {
        
        if playButton.isEnabled {
            playButton.setTitle("", for: .normal)
            playButton.isEnabled = false
        }
        
        else {
            playButton.setTitle("Play", for: .normal)
            playButton.isEnabled = true
        }
    }
    
    //switches state of all note buttons (between enabled/disabled)
    func setNoteButtons(enable: Bool) {
        
        if enable {
            cButton.setTitle("C", for: .normal)
            cButton.isEnabled = true
            cSharpButton.setTitle("C#", for: .normal)
            cSharpButton.isEnabled = true
            dButton.setTitle("D", for: .normal)
            dButton.isEnabled = true
            dSharpButton.setTitle("D#", for: .normal)
            dSharpButton.isEnabled = true
            eButton.setTitle("E", for: .normal)
            eButton.isEnabled = true
            fButton.setTitle("F", for: .normal)
            fButton.isEnabled = true
            fSharpButton.setTitle("F#", for: .normal)
            fSharpButton.isEnabled = true
            gButton.setTitle("G", for: .normal)
            gButton.isEnabled = true
            gSharpButton.setTitle("G#", for: .normal)
            gSharpButton.isEnabled = true
            aButton.setTitle("A", for: .normal)
            aButton.isEnabled = true
            aSharpButton.setTitle("A#", for: .normal)
            aSharpButton.isEnabled = true
            bButton.setTitle("B", for: .normal)
            bButton.isEnabled = true
        }
            
        else {
            cButton.setTitle("", for: .normal)
            cButton.isEnabled = false
            cSharpButton.setTitle("", for: .normal)
            cSharpButton.isEnabled = false
            dButton.setTitle("", for: .normal)
            dButton.isEnabled = false
            dSharpButton.setTitle("", for: .normal)
            dSharpButton.isEnabled = false
            eButton.setTitle("", for: .normal)
            eButton.isEnabled = false
            fButton.setTitle("", for: .normal)
            fButton.isEnabled = false
            fSharpButton.setTitle("", for: .normal)
            fSharpButton.isEnabled = false
            gButton.setTitle("", for: .normal)
            gButton.isEnabled = false
            gSharpButton.setTitle("", for: .normal)
            gSharpButton.isEnabled = false
            aButton.setTitle("", for: .normal)
            aButton.isEnabled = false
            aSharpButton.setTitle("", for: .normal)
            aSharpButton.isEnabled = false
            bButton.setTitle("", for: .normal)
            bButton.isEnabled = false
        }
    }
    
    @IBAction func didTapPlay(_ sender: Any) {
        
        hasNotAnswered = true
        
        let player = NotePlayer.sharedInstance
        
        //plays the sequence or chord and temporarily disables the play button until the sound has finished playing
        if inSeqMode {
            player.playSeq(soundFileNames: playlist)
            playButton.isEnabled = false
            delay(Double(numNotes)) {
                self.playButton.isEnabled = true
            }
        } else {
            player.playChord(soundFileNames: playlist)
            playButton.isEnabled = false
            delay(1.0) {
                self.playButton.isEnabled = true
            }
        }

        setNoteButtons(enable: true)
        setButton(button: nextButton, title: "Skip", enable: true)
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    @IBAction func didTapNext(_ sender: Any) {

        if hasNotAnswered {
            tries += 1
            percentage = points / tries * 100
            scoreLabel.text = String(Int(points)) + "/" + String(Int(tries)) + ", " + String(roundTo(num: percentage, places: 1)) + "%"
        }
        reset()
    }
    
    func clearAnswers() {
        
        for answer in answers {
            answer.text = "-"
            answer.textColor = UIColor.white
        }
        ansNumber = 1
    }
    
    @IBAction func didTapHome(_ sender: Any) {

        let alert = UIAlertController(title: "Return home?", message: "Your score will be reset.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            //self.dismiss(animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let modeViewController = storyboard.instantiateViewController(withIdentifier: "ModeViewController")
            self.present(modeViewController, animated: true, completion: nil)
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func checkAns() {
        
        hasNotAnswered = false
        tries += 1
        
        var isCorrect = true //remains true if all inputted notes are correct
        
        setNoteButtons(enable: false)
        
        //order must be correct if in sequence mode
        if inSeqMode {
            for n in 0...numNotes-1 {
                
                if self.answers[n].text == self.correctNotes[n] {
                    self.answers[n].textColor = UIColor.green
                }
                else {
                    self.answers[n].textColor = UIColor.red
                    isCorrect = false
                }
            }
        }
        
        //order does not matter in chord mode
        else {
            
            let correctNotesCopy: [String] = correctNotes //new array containing same contents as correctNotes
            var foundSoFar = [false, false, false, false, false] //corresponds to correctNotes, marks matches found
            for n in 0...numNotes-1 {
                if findMatch(key: answers[n].text ?? "", list: correctNotesCopy, flags: &foundSoFar) {
                    answers[n].textColor = UIColor.green
                }
                else {
                    answers[n].textColor = UIColor.red
                    isCorrect = false
                }
            }
        }
       
        if isCorrect {
            nextButton.setTitle("Next", for: .normal)
            flipPlayButton()
            points += 1
        }
        
        else {
            prevAnsWrong = true
            setNoteButtons(enable: true) //re-enable the notes
        }
        
        percentage = points / tries * 100
        scoreLabel.text = String(Int(points)) + "/" + String(Int(tries)) + ", " + String(roundTo(num: percentage, places: 1)) + "%"
    }
    
    //returns num to the given number of places
    func roundTo(num: Double, places: Int) -> Double {
        
        let divisor = pow(10.0, Double(places))
        return (num * divisor).rounded() / divisor
    }
    
    //determines whether a match exists in "list", sets the corresponding element in "flags" to true
    func findMatch(key: String, list: [String], flags: inout [Bool]) -> Bool {
        
        var found = false
        let length = list.count
        var current = 0
        
        while (!found && current < length) {
            if key == list[current] && !flags[current] {
                found = true
                flags[current] = true
            }
            current += 1
        }
        return found
    }
    
    
    //nts might be able to simplify this now that we added the array thing
    @IBAction func didTapNote(_ sender: UIButton) {
        
        if prevAnsWrong {
            clearAnswers()
            prevAnsWrong = false
        }
        
        switch ansNumber {
        case 1:
            answerLabel1.text = sender.titleLabel?.text
        case 2:
            answerLabel2.text = sender.titleLabel?.text
        case 3:
            answerLabel3.text = sender.titleLabel?.text
        case 4:
            answerLabel4.text = sender.titleLabel?.text
        case 5:
            answerLabel5.text = sender.titleLabel?.text
        default:
            break
        }
        if ansNumber == numNotes {
            checkAns()
        }
        else {
            ansNumber += 1
        }
    }
}
