//
//  EntryViewController.swift
//  Notes app
//
//  Created by User on 27/1/22.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var titlelable: UILabel!
    @IBOutlet weak var notelable: UITextView!
    
    var noteTitle: String = ""
    var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlelable.text = noteTitle
        notelable.text = note

        
    }
    

}
