//
//  BeatViewController.swift
//  Rhyme_Stash
//
//  Created by Dilip Rao on 5/3/17.
//  Copyright © 2017 The Bingo Boiz. All rights reserved.
//

import UIKit
import AVFoundation

class BeatViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "wu-tang.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            player = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }
    
    }

    
    
    @IBAction func playSound(_ sender: UIButton) {
    
    player.play()
    }
    @IBAction func stopSound(_ sender: UIButton) {
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
