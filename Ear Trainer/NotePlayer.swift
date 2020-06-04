//
//  NotePlayer.swift
//  Ear Trainer
//
//  Created by Kai Moore on 12/31/18.
//  Copyright © 2018 Kai Moore. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class NotePlayer: NSObject, AVAudioPlayerDelegate {
    
    static let sharedInstance = NotePlayer()
    
    private override init() {}
    
    let delayTime = 0.9 //seconds before playing the next note in a sequence
    var players: [URL: AVAudioPlayer] = [:] //dictionary of players/URLs
    
    
    //plays a single note with the given sound file name and adds it to players dictionary if it is not there
    func playSound(soundFileName: String){
        
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "mp3") else { return }
        let soundFileNameURL = URL(fileURLWithPath: bundle)
        
        if let player = players[soundFileNameURL] { //a player for the sound exists in players, set player to it
            
            player.prepareToPlay()
            player.play()
            
        } else { //player has not been found, create a new player with the URL if possible
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    //plays all given notes simultaneously
    func playChord(soundFileNames: [String]) {
        
        for soundFileName in soundFileNames {
            playSound(soundFileName: soundFileName)
        }
    }
    
    
    //wrapper to recursive function
    func playSeq(soundFileNames: [String]) {playSeq(soundFileNames: soundFileNames, currentIndex: 0)}
    
    //plays a note in soundFileNames, then traverses to the next note after a delay
    func playSeq(soundFileNames: [String], currentIndex: Int) {
        
        if currentIndex >= soundFileNames.count {return}
        else {
            playSound(soundFileName: soundFileNames[currentIndex])
            
            delay(delayTime) {
                self.playSeq(soundFileNames: soundFileNames, currentIndex: currentIndex + 1)
            }
        }
    }
    
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
