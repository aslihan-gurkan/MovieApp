//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDetails: UITextView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    var name = ""
    var details = ""
    var releaseDate = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieName.text = name
        movieDetails.text = details
        date.text = releaseDate
        backgroundImage.image = image
        
        
        // Create image
        let emptyImage = UIImage(named: "empty_heart.png")
        
        likeButton.setBackgroundImage(emptyImage, for: .normal)
        likeButton.addTarget(self, action:#selector(self.imageButtonTapped(_:)), for: .touchUpInside)
        
        
//        likeButton.setBackgroundImage(fillImage, for: .selected)
//        likeButton.isSelected = true
        
//        let button = UIButton()
//        button.frame = CGRect(x: 100, y: 200, width: 20, height: 20)
//        button.setBackgroundImage(image, for: UIControl.State.normal)
//        button.addTarget(self, action:#selector(self.imageButtonTapped(_:)), for: .touchUpInside)
//
//        self.view.addSubview(button)
//
        
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        
        if let data = backgroundImage.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data) { metadata, error in
                if error == nil {
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            //Database
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference : DocumentReference? = nil
                            let firestorePost = ["imageUrl" : imageUrl!, "likesBy" : Auth.auth().currentUser?.email, "releaseDate" : self.releaseDate, "movieName" : self.name , "movieDetail" : self.details] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("MovieDetail").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.showAlertMessage(titleInput: "Error", messageInput: "Error")
                                } else {
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                        } else {
                            self.showAlertMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "download url Error")
                        }
                    }
                } else {
                    self.showAlertMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "put data Error")
                }
            }
        }
    }
    
    @objc func imageButtonTapped(_ sender:UIButton!)
    {
        let fillImage = UIImage(named: "fill_heart.png")
        likeButton.setBackgroundImage(fillImage, for: .normal)
        print("My image button tapped")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    

}
