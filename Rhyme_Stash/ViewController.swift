//
//  ViewController.swift
//  Rhyme_Stash
//
//  Created by jmoran2 on 4/24/17.
//  Copyright © 2017 The Bingo Boiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
   var startingWord = ""
    
    @IBOutlet weak var startingWordText: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rhymeSegue1"{
        let svc = segue.destination as! RhymeViewController
        if segue.identifier == "rhymeSegue1"{
        svc.rhymeWord = self.startingWord
            }
        }
    }
    
    @IBAction func findRhymez(_ sender: UIButton) {
        startingWord = startingWordText.text!
    }
    
}

