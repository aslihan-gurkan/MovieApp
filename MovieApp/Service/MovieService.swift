//
//  TMDBService.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 12.02.2023.
//

import Foundation

class MovieService {
    
    func getMovies(url : URL, completion : @escaping (Movies?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
           
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let movies = try? JSONDecoder().decode(Movies.self, from: data)
                if let movies = movies {
                    completion(movies)
                }
            }
            
        }.resume()
    }
    
}
