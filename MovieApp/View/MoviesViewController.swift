//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var resultListViewModel : ResultsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultListViewModel == nil ? 0 : self.resultListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        let resultViewModel = self.resultListViewModel.resultAtIndex(indexPath.row)
//        cell.titleLabel.text = resultViewModel.title
//
//        let inputFormatter = DateFormatter()
//        inputFormatter.dateFormat = "YYYY-MM-dd"
//        let outputFormatter = DateFormatter()
//        outputFormatter.dateFormat = "MMM d, yyy"
//        let date = inputFormatter.date(from: resultViewModel.releaseDate)
//        let dateString = outputFormatter.string(from: date!)
//        cell.releaseDate.text = dateString
        
        DispatchQueue.main.async {
            cell.titleLabel.text = resultViewModel.title
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "YYYY-MM-dd"
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyy"
            let date = inputFormatter.date(from: resultViewModel.releaseDate)
            let dateString = outputFormatter.string(from: date!)
            cell.releaseDate.text = dateString
        }
        
        let path = URL(string: "https://image.tmdb.org/t/p/original\(resultViewModel.posterPath)")
        print("https://image.tmdb.org/t/p/original\(resultViewModel.posterPath)")
        URLSession.shared.dataTask(with: path!) {
            (data, response, error) in
            guard
                let data = data
            else {
                return
            }
            
            DispatchQueue.main.async {
                cell.movieImage.image = UIImage(data: data)
            }
        }.resume()
        
        return cell
    }
    
    func getData() {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=35bb83deee4db42da73c6096881a5770")!
        
        MovieService().getMovies(url: url) { movies in
            
            if let movies = movies {
                self.resultListViewModel = ResultsViewModel(resultList: movies.results)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                self.showAlertMessage(titleInput: "Error", messageInput: "Error!, Cannot load movies")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let detailsViewController : DetailsViewController = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        */
        
        let details = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        let resultViewModel = self.resultListViewModel.resultAtIndex(indexPath.row)
        
        let path = URL(string: "https://image.tmdb.org/t/p/original\(resultViewModel.result.poster_path)")
        
//        let url = URL(string:"http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
        if let data = try? Data(contentsOf: path!)
        {
            details?.image = UIImage(data: data)!
        }
        
        /*URLSession.shared.dataTask(with: path!) {
            (data, response, error) in
            guard
            let data = data
            else {
                return
            }
            
            DispatchQueue.main.async {
                details?.image = UIImage(data: data) ??  UIImage(named: "shotgun_wedding_poster.jpeg")!
            }
        }.resume()*/
        
//        DispatchQueue.global(qos: .background).async {
//           do {
//             let data = try Data.init(contentsOf: URL.init(string:"https://image.tmdb.org/t/p/original\(resultViewModel.result.poster_path)")!)
//              DispatchQueue.main.async {
//                  details?.image = UIImage(data: data)!
//              }
//            }
//           catch {
//               return
//           }
//        }
        
//        if let filePath = Bundle.main.path(forResource: "https://image.tmdb.org/t/p/original\(resultViewModel.result.poster_path)", ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            details?.backgroundImage.contentMode = .scaleAspectFit
//            details?.image = image
//        }
        
        
        details?.name = resultViewModel.result.title
        details?.details = resultViewModel.result.overview

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-dd"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM d, yyy"
        let date = inputFormatter.date(from: resultViewModel.result.release_date)
        let dateString = outputFormatter.string(from: date!)
        details?.releaseDate = dateString
        
//        DispatchQueue.main.async {
//            details?.name = resultViewModel.result.title
//            details?.details = resultViewModel.result.overview
//
//            let inputFormatter = DateFormatter()
//            inputFormatter.dateFormat = "YYYY-MM-dd"
//            let outputFormatter = DateFormatter()
//            outputFormatter.dateFormat = "MMM d, yyy"
//            let date = inputFormatter.date(from: resultViewModel.result.release_date)
//            let dateString = outputFormatter.string(from: date!)
//            details?.releaseDate = dateString
//
//        }
        
        navigationController?.pushViewController(details!, animated: true)

    }
    
}
