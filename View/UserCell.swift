//
//  UserCell.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 10/07/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit
import Firebase


//Customise the table cell
class UserCell: UITableViewCell {
    
    var message: Message?{
        didSet{
            
            setupNameAndProfileImage()
            
            detailTextLabel?.text = message?.text
            
            //convert the time to a proper format using date formatter
            if let seconds = message?.timestamp?.doubleValue {
                let timestampDate = Date(timeIntervalSince1970: seconds)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm:ss a"
                timeLabel.text = dateFormatter.string(from: timestampDate)
            }
            
        }
    }
    
    //call the name within a new function
    fileprivate func setupNameAndProfileImage(){
        
        if let id = message?.chatPartnerId() {
            let ref = Database.database().reference().child("All Users").child(id)
            ref.observeSingleEvent(of: .value, with: { (DataSnapshot) in
                
                if let dictionary = DataSnapshot.value as? [String: AnyObject] {
                    self.textLabel?.text = dictionary["Name"] as? String
                    
                    if let profileImageUrl = dictionary["profileImageUrl"] as? String {
                        self.profileImageView.loadImageUsingCacheWithURLString(urlString: profileImageUrl)
                    }
                }
                
            }, withCancel: nil)
        }
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
        
        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        //cell subview hierarchy
        addSubview(profileImageView)
        addSubview(timeLabel)
    
        //Profile image: x,y,width,height anchors
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //Time: x,y,width,height anchors
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //timeLabel.heightAnchor.constraint(equalTo: textLabel!.heightAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



