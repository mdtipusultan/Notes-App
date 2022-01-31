//
//  ViewController.swift
//  Notes app
//
//  Created by User on 26/1/22.
//  Copyright © 2022 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var NoNotelable: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var models: [(title: String, desc: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableview.dataSource = self
        tableview.delegate = self
        title = "Notes"
    }
    
    //MARK:- TABLE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].desc
        
        
        return cell
       }

    @IBAction func Add_button(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "new note") as? NoteViewController else {
                return
            }
        
        vc.title = "New Note"
               vc.navigationItem.largeTitleDisplayMode = .never
               vc.completion = { noteTitle, note in
                   self.navigationController?.popToRootViewController(animated: true)
                   self.models.append((title: noteTitle, desc: note))
                   self.NoNotelable.isHidden = true
                   self.tableview.isHidden = false

                   self.tableview.reloadData()
               }
            
            navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let model = models[indexPath.row]

               // Show note controller
               guard let vc = storyboard?.instantiateViewController(identifier: "entry") as? EntryViewController else {
                   return
               }
               vc.navigationItem.largeTitleDisplayMode = .never
               vc.title = "Note"
               vc.noteTitle = model.title
               vc.note = model.desc
               navigationController?.pushViewController(vc, animated: true)
    }
    
}

