//
//  extraViewController.swift
//  Rhyme_Stash
//
//  Created by Dilip Rao on 5/16/17.
//  Copyright © 2017 The Bingo Boiz. All rights reserved.
//

import UIKit

class extraViewController: UIViewController {
    
    var extra = ""
    
    @IBOutlet weak var r1: UILabel!
    @IBOutlet weak var r2: UILabel!
    @IBOutlet weak var r3: UILabel!
    @IBOutlet weak var r4: UILabel!
    @IBOutlet weak var r5: UILabel!
    @IBOutlet weak var r6: UILabel!
    @IBOutlet weak var r7: UILabel!
    @IBOutlet weak var r8: UILabel!
    @IBOutlet weak var r9: UILabel!
    @IBOutlet weak var r10: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Related Words: " + extra
        // Do any additional setup after loading the view.
        
        let urlString1 = "https://api.datamuse.com/words?rel_trg=\(extra)"
        //"https://api.datamuse.com/words?rel_rhy=beat"
        
        if let url1 = NSURL(string: urlString1)
        {
            if let myData = try? NSData(contentsOf: url1 as URL, options: [])//try cheks for url connection
            {
                let json1 = JSON(data: myData as Data)
                associate(json1: json1)//function that lets me use the json data
            }
        }
    }
    
    func associate(json1: JSON)
    {
        print(json1[0]["word"].stringValue)
        r1.text = json1[0]["word"].stringValue
        r2.text = json1[1]["word"].stringValue
        r3.text = json1[2]["word"].stringValue
        r4.text = json1[3]["word"].stringValue
        r5.text = json1[4]["word"].stringValue
        r6.text = json1[5]["word"].stringValue
        r7.text = json1[6]["word"].stringValue
        r8.text = json1[7]["word"].stringValue
        r9.text = json1[8]["word"].stringValue
        r10.text = json1[9]["word"].stringValue
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
