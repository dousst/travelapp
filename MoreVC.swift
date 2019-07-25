//
//  MoreVC.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 26/06/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //set the back bar button item style
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        //Set the UI Navigation title to an image
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "map_marker"))
        self.navigationItem.title = "Discover Grenada"
        
        //Hide the navigation bar upon scrolling
        self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.hidesBarsOnTap = true
    }
}
