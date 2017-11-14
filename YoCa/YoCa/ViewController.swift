//
//  ViewController.swift
//  YoCa
//
//  Created by Carmen Bijlaart on 14-11-17.
//  Copyright © 2017 Carmen Bijlaart. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var txtviewInsert: UITextView!
    @IBOutlet weak var btnSend: UIButton!

    
    //set the root reference with the child reference from the firebase database
    let conditionref = Firebase.Database.database(url: "https://yoca-f0730.firebaseio.com").reference().child("condition")
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtviewInsert.layer.borderWidth = 1
        txtviewInsert.layer.borderColor = UIColor.darkGray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //a checker, ook wel ophaler van de info uit de database
        conditionref.observe(DataEventType.value, with: { (snapshot) in
            self.labelText.text = snapshot.value as! String?
        })
      
        
    }
    
    
    @IBAction func btnSendDidTouch(_ sender: Any) {
        //change the value
        if(txtviewInsert != nil){
            
           conditionref.setValue(txtviewInsert.text)
        }
        
    }
    
}

