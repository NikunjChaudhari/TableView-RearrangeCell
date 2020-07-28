//
//  ViewController.swift
//  TableView-MovableCell
//
//  Created by macos on 28/07/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var arr = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "Your Position of cell is \(arr[indexPath.row])"
        return cell!
    }
    
    // header for table
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var btn = UIButton(frame: CGRect(x: 0, y: 0, width: tbl.frame.size.width, height: 60))
        btn.setTitle("Edit", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.addTarget(self, action: #selector(self.handle), for: .touchUpInside)
        tbl.addSubview(btn)
        return btn
    }
    
    
    //  Reordering/deleting  cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = arr[sourceIndexPath.row]
        arr.remove(at: item)
        arr.insert(item, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arr.remove(at: indexPath.row)
        tbl.deleteRows(at: [indexPath], with: .bottom)
    }
    
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func handle(sender: UIButton)
    {
        tbl.isEditing = !tbl.isEditing
        sender.setTitle("Done", for: .normal)
    }

}

