//
//  AppDemoViewController.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 22/06/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit
import paper_onboarding

class AppDemoViewController: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var onboarding_Obj: OnboardinViewClass! //UIView Outlet
    
    @IBOutlet weak var GetStarted_But: UIButton! //UI Button Outlet
    
    var userScreenData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let onboarding = PaperOnboarding() //PaperOnboarding(itemsCount: 3)
        onboarding_Obj.dataSource = self //set a data source
        onboarding_Obj.delegate = self //set the delegate
        
        //onboarding_Obj.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(onboarding_Obj)
        /*
        // add constraints
       for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        } */
}
    
    //button action
    @IBAction func GetStartedPressed(_ sender: Any) {
        
        userScreenData.set(true, forKey: "demoComplete")
        //save the user data
        userScreenData.synchronize()
        
    }
    
    
    
}


//Set the protocol and delegate methods

extension AppDemoViewController : PaperOnboardingDataSource, PaperOnboardingDelegate{
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    //Set the datasource component
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
  
        //Set 3 background colours
        let bgOne = #colorLiteral(red: 0, green: 0.4660990834, blue: 0.2602835298, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.8409169316, green: 0.6583849192, blue: 0, alpha: 1)
        let bgThree = #colorLiteral(red: 0.147158891, green: 0.6472712159, blue: 0.6987758875, alpha: 1) //UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1)
        let textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        //set Fonts' features
        let titleFont = UIFont(name: "Avenir-Medium", size: 20)!
        let descripFont = UIFont(name: "Avenir-Book", size: 16)!
        
        //return an array with image and its title
        return [
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "challenge"), //Challenges Icon
                title: "Challenge",
                description: "Get a taste of our island while competing with other visitors for discounts and other prizes.",
                pageIcon: #imageLiteral(resourceName: "compass"),
                color: bgThree,
                titleColor: textColor,
                descriptionColor: textColor,
                titleFont: titleFont,
                descriptionFont: descripFont),
    
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "explore"),//Explore Icon
                               title: "Explore",
                               description: "Get inside information to all the best sites in Grenada, recommended activities and the best deals to make your trip better.",
                               pageIcon: #imageLiteral(resourceName: "compass"),
                               color: bgOne,
                               titleColor: textColor,
                               descriptionColor: textColor,
                               titleFont: titleFont,
                               descriptionFont: descripFont),
        
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "Chat1"), //Connect Icon
                               title: "Connect",
                               description: "Connect with other visitors and engage with tourism officials to get your questions answered instantly.",
                               pageIcon: #imageLiteral(resourceName: "compass"),
                               color: bgTwo,
                               titleColor: textColor,
                               descriptionColor: textColor,
                               titleFont: titleFont,
                               descriptionFont: descripFont)
        ][index]//for which ever screen is selected then the appropriate array cell is displayed

    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2{
        //hide or show the 'Get Started' Button
            GetStarted_But.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2{
            if GetStarted_But.isHidden == false{
                GetStarted_But.isHidden = true
            }
        }
    }
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
        
    }
}
