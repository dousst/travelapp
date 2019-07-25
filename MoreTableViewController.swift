//
//  MoreTableViewController.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 26/06/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit

class MoreTableViewController: UITableViewController {
    
    //Declaring variable which holds title of table cells put into an array
    var cellTitles = [String]()
    
    //Declare image icons
    var tableIcons = [UIImage]()
    
    //Declaring identifiers which connects to other view controllers
    var moreIdentifiers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding content to the cellTitles array
        cellTitles = ["Deals of the Month","My Profile","Help","About","Language"]
        tableIcons = [#imageLiteral(resourceName: "us_dollar"), #imageLiteral(resourceName: "user_male"), #imageLiteral(resourceName: "help"), #imageLiteral(resourceName: "info"), #imageLiteral(resourceName: "maintenance")]
        moreIdentifiers = ["MonthlyDealsView","ProfileView","HelpView","AboutView","LanguagesView"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false


        //set the back bar button item style
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        //Set the UI Navigation title to an image
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "map_marker"))
        self.navigationItem.title = "Discover Grenada"
        
        //Hide the navigation bar upon scrolling
        //self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.hidesBarsOnTap = true
        
        //set the cell height
        self.tableView.rowHeight = 75.0
        
    }
    
    //Set up the View will appear function
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //count the array length
        return cellTitles.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //Create and edit the contents of a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath)

        //Icon image
        cell.imageView?.image = tableIcons[indexPath.row]
        cell.imageView?.tintColor =  UIColor.darkGray
        
        //Cell label
        cell.textLabel?.text = cellTitles[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray
        
        return cell
    }
    
    //Animate table function
    func animateTable(){
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableHeight = tableView.bounds.size.height
        
        //move the height down
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        //set up the animation effects
        var delayCounter = 0
        for cell in cells{
            UIView.animate(withDuration: 1.75, delay: Double (delayCounter) * 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1 //increment the counter
        }
    }
    
    //Connect to each relevant view upon selecting a row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = moreIdentifiers[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
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
