//
//  MainViewController.swift
//  TotalityTask
//
//  Created by Karthikeyan K on 18/06/21.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add corner radius to mainView and set tableView delegate to self
        mainView.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Create cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        return cell
    }
    
    // Method to run when a cell is tapped. Call 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        guard let pageViewController = storyboard?.instantiateViewController(identifier: "PageViewController") else {
            return
        }
        present(pageViewController, animated: false, completion: nil)
    }
}
