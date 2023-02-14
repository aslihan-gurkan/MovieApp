//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import Foundation

struct MoviesViewModel {
    let movies : Movies
}

extension MoviesViewModel {
    var page : Int {
        return self.movies.page
    }
    var results : [Result] {
        return self.movies.results
    }
    var total_pages : Int {
        return self.movies.total_pages
    }
    var total_results : Int {
        return self.movies.total_results
    }
}
