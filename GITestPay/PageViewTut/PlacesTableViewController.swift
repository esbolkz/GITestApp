//
//  PlacesTableViewController.swift
//  PageViewTut
//
//  Created by kraft on 2/21/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    
    var place = Restaurant()
    var ind = 0
    
    var ratingFromPageControl = [Int]()
    
    
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ind)
        print(ratingFromPageControl)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    func sortTable() -> [(String,Int)]{
        
        var restCoupledWithRate:[String:Int] = [String:Int]()
        for i in 0..<ratingFromPageControl.count {
            restCoupledWithRate[place.names[ind][i]] = ratingFromPageControl[i]
        }
        let sortedArray = restCoupledWithRate.sorted{$0.value > $1.value}
        return sortedArray
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restCell", for: indexPath)
        
        let sorta = sortTable()
        
        //Configure the cell...
        if let placeCell = cell as? CustomTableViewCell {
            
            placeCell.ratingStar.rating = Double(sorta[indexPath.row].1)
            placeCell.name.text = sorta[indexPath.row].0
            placeCell.address.text = place.address[ind][indexPath.row]
            placeCell.imageInd = place.pictures[ind][indexPath.row]
            
        }
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRest"{
            var destinationvc = segue.destination
            if let navcon = destinationvc as? UINavigationController {
                destinationvc = navcon.visibleViewController ?? destinationvc
            }
            if let detailVC = destinationvc as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow{
                    let sortedArray = self.sortTable()
                    detailVC.navigationItem.title = sortedArray[indexPath.row].0
                    detailVC.rateHolder = Double(sortedArray[indexPath.row].1)
                }
            }
        }
    }
    
    
    
    
    
    
}
