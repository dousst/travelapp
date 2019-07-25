//
//  ChatInputContainerView.swift
//  DestinationGrenada
//
//  Created by Denee Toussaint on 20/07/2018.
//  Copyright © 2018 Denee Toussaint. All rights reserved.
//

import UIKit

class ChatInputContainerView: UIView, UITextFieldDelegate{
 
    weak var chatLogController: ChatLogController? {
        didSet {

            //tap send button
            sendButton.addTarget(chatLogController, action: #selector(ChatLogController.handleSend), for: .touchUpInside)
            
            //tap image icon
            uploadImageView.addGestureRecognizer(UITapGestureRecognizer(target: chatLogController, action: #selector(ChatLogController.handleUploadTap)))
        }
    }

    
    //Creating a reference to the message textfield
    lazy var msgTextField: UITextField = {
        
        let mTextField = UITextField()
        mTextField.placeholder = "Enter message here..." //default text
        mTextField.translatesAutoresizingMaskIntoConstraints = false
        mTextField.delegate = self
        return mTextField
    }()
    
    
    let uploadImageView: UIImageView = {
        let uploadImageView = UIImageView()
        uploadImageView.isUserInteractionEnabled = true
        
        //colour the image
        if let myImage = UIImage(named: "image_file") {
            let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
            uploadImageView.image = tintableImage
        }
        
       
        uploadImageView.tintColor = UIColor.lightGray
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return uploadImageView
    }()
    
    let sendButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white

        addSubview(uploadImageView)
        //x,y,w,h constraints
        uploadImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        uploadImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        uploadImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        uploadImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //Setting up the Send Button
        sendButton.setTitle("Send", for: UIControlState())
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sendButton) //place another view into the container view
        
        //x,y,w,h constraints
        sendButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        //Setting up the Textfield area
        addSubview(self.msgTextField) //place another view into the container view
        
        //x,y,h,w constraints
        self.msgTextField.leftAnchor.constraint(equalTo: uploadImageView.rightAnchor, constant: 8).isActive = true
        self.msgTextField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.msgTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        self.msgTextField.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor.darkGray
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorLineView) //place another view into the container view
        
        //x,y,h,w constraints
        separatorLineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorLineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        separatorLineView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        chatLogController?.handleSend()
        return true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
