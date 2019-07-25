//
//  ViewController.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 21/06/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    //Animating the Events and Discounts buttons

    @IBOutlet weak var EventsButtonConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var DiscountsButtonConstraints: NSLayoutConstraint!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Animating the Events and Discounts Buttons
        EventsButtonConstraints.constant -= view.bounds.width
        DiscountsButtonConstraints.constant -= view.bounds.width
        
        
        //set the back bar button item style
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        //Set the UI Navigation title to an image
        //self.navigationItem.titleView = UIImageView(image: UIImage(named: "map_marker"))
        
         self.navigationItem.title = "Discover Grenada"

        //Hide the navigation bar upon scrolling, use for table with long list
        //self.navigationController?.hidesBarsOnSwipe = true
        //self.navigationController?.hidesBarsOnTap = true
        
        // Display a Log Out button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "exit"), style: .plain, target: self, action: #selector(HandleLogOut))
        
        //Check if the user is not Signed in and send them to the sign in view if true
        if Auth.auth().currentUser?.uid == nil{
            HandleLogOut()
        }
    }
    
    //Logging out function, add to every view where user log in is required. Upon logging out, users are taken to the sign in view
    @objc func HandleLogOut(){
        
        do{
            try Auth.auth().signOut()
        } catch let SignOutError{
            print(SignOutError)
        }
        
        //Send the user to the Sign In View
        let loginController = RegisterViewController()
        present(loginController, animated: true, completion: nil)
        
    }

    var animationPerformedOnce = false
    //View did appear function
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //check if the animation wasn't already performed
        if !animationPerformedOnce{
        
        //Animate the event buttons
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations:{ self.EventsButtonConstraints.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
    }, completion: nil)
        
        //Animate the discount buttons
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations:{ self.DiscountsButtonConstraints.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
        
        //set the animation performed once to true to prevent it from happening again when the view's appears
        animationPerformedOnce = true
    }
    
}



