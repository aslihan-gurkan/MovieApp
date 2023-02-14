//
//  Movies.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import Foundation

struct Movies : Decodable {
    var page : Int
    var results = [Result]()
    var total_pages : Int
    var total_results : Int
}


