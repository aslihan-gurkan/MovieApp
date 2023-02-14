//
//  Results.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import Foundation

struct Result : Decodable {
    var adult : Bool
    var backdrop_path : String
    var genre_ids = [Int]()
    var id : Int
    var original_language : String
    var original_title : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var release_date : String
    var title : String
    var video : Bool
    var vote_average : Double
    var vote_count : Int
}
