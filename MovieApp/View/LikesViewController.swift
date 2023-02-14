//
//  LikesViewController.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit
import Firebase
//import SDWebImage

class LikesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var likesTableView: UITableView!
    
    var movieNameArray = [String]()
    var movieReleaseDateArray = [String]()
    var movieImageArray = [String]()
    
    var movieIdArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likesTableView.dataSource = self
        likesTableView.delegate = self
        
        
        getDataFromDbFirestore()
    }
    
    func getDataFromDbFirestore() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikesCell", for: indexPath) as! LikesTableViewCell
        
        cell.likedMovieName.text = movieNameArray[indexPath.row]
        cell.likedMovieReleaseDate.text = movieReleaseDateArray[indexPath.row]
        
        cell.movieIdLabel.text = movieIdArray[indexPath.row]
        return cell
    }
    
}
