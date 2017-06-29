//
//  RhymeViewController.swift
//  Rhyme_Stash
//
//  Created by Dilip Rao on 5/3/17.
//  Copyright © 2017 The Bingo Boiz. All rights reserved.
//

import UIKit
import AVFoundation

class RhymeViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var rhymeWord = ""
    var count = 5
    var a = 0
    var b = 1
    var c = 2
    var d = 3
    var e = 4
    
    var word1 = ""
    var word2 = ""
    var word3 = ""
    var word4 = ""
    var word5 = ""
    
    
    @IBOutlet weak var RhymeZero: UIButton!
    @IBOutlet weak var RhymeOne: UIButton!
    @IBOutlet weak var RhymeTwo: UIButton!
    @IBOutlet weak var RhymeThree: UIButton!
    @IBOutlet weak var RhymeFour: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        RhymeZero.layer.cornerRadius = 8.0
        RhymeZero.clipsToBounds = true
        
        RhymeOne.layer.cornerRadius = 8.0
        RhymeOne.clipsToBounds = true
        
        RhymeTwo.layer.cornerRadius = 8.0
        RhymeTwo.clipsToBounds = true
        
        RhymeThree.layer.cornerRadius = 8.0
        RhymeThree.clipsToBounds = true
        
        RhymeFour.layer.cornerRadius = 8.0
        RhymeFour.clipsToBounds = true
        
        navigationItem.title = rhymeWord
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = "https://api.datamuse.com/words?rel_rhy=\(rhymeWord)"
        //"https://api.datamuse.com/words?rel_rhy=beat"
        
        if let url = NSURL(string: urlString)
        {
            if let myData = try? NSData(contentsOf: url as URL, options: [])//try cheks for url connection
            {
                let json = JSON(data: myData as Data)
                print(json[0]["word"].stringValue)
                parse(json: json)//function that lets me use the json data
            }
        }
        
        let urlString1 = "https://api.datamuse.com/words?rel_trg=\(rhymeWord)"
        //"https://api.datamuse.com/words?rel_rhy=beat"
        
        if let url1 = NSURL(string: urlString1)
        {
            if let myData = try? NSData(contentsOf: url1 as URL, options: [])//try cheks for url connection
            {
                let json1 = JSON(data: myData as Data)
                print(json1[0]["word"].stringValue)
                associate(json1: json1)//function that lets me use the json data
            }
        }
        
        //AUDIO PLAYER
        
        let path = Bundle.main.path(forResource: "wu-tang.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            player = sound
        } catch {
            // couldn't load file :(
        }
        
    }
    
    func parse(json: JSON)
    {
        word1 = json[a]["word"].stringValue
        word2 = json[b]["word"].stringValue
        word3 = json[c]["word"].stringValue
        word4 = json[d]["word"].stringValue
        word5 = json[e]["word"].stringValue
        
        RhymeZero.setTitle(word1, for: .normal)
        RhymeOne.setTitle(word2, for: .normal)
        RhymeTwo.setTitle(word3, for: .normal)
        RhymeThree.setTitle(word4, for: .normal)
        RhymeFour.setTitle(word5, for: .normal)
    }
    
    
    func associate(json1: JSON)
    {
        //  let word0 = json1[0]["word"].stringValue
        //  RhymeFour.setTitle(word0, for: .normal)
        print(json1[0]["word"].stringValue)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as! extraViewController
        
        if segue.identifier == "word1"{
            svc.extra = self.word1
        }
        if segue.identifier == "word2"{
            svc.extra = self.word2
        }
        if segue.identifier == "word3"{
            svc.extra = self.word3
        }
        if segue.identifier == "word4"{
            svc.extra = self.word4
        }
        if segue.identifier == "word5"{
            svc.extra = self.word5
        }
    }
    
    @IBAction func playBeat(_ sender: UIButton) {
        
        player.play()
    }
    
    @IBAction func stopBeat(_ sender: UIButton) {
        if player != nil {
            player.stop()
        }
    }
    
    @IBAction func refreshSuggestions(_ sender: UIButton) {
        a = a + count
        b = b + count
        c = c + count
        d = d + count
        e = e + count
        
        func parse(json: JSON)
        {
            word1 = json[a]["word"].stringValue
            word2 = json[b]["word"].stringValue
            word3 = json[c]["word"].stringValue
            word4 = json[d]["word"].stringValue
            word5 = json[e]["word"].stringValue
            
            RhymeZero.setTitle(word1, for: .normal)
            RhymeOne.setTitle(word2, for: .normal)
            RhymeTwo.setTitle(word3, for: .normal)
            RhymeThree.setTitle(word4, for: .normal)
            RhymeFour.setTitle(word5, for: .normal)
        }
        let urlString = "https://api.datamuse.com/words?rel_rhy=\(rhymeWord)"
        //"https://api.datamuse.com/words?rel_rhy=beat"
        
        if let url = NSURL(string: urlString)
        {
            if let myData = try? NSData(contentsOf: url as URL, options: [])//try cheks for url connection
            {
                let json = JSON(data: myData as Data)
                print(json[0]["word"].stringValue)
                parse(json: json)//function that lets me use the json data
            }
        }
    }
    
    @IBAction func changeNumSyllables(_ sender: UIButton) {
    }
    
    
    
    
}
