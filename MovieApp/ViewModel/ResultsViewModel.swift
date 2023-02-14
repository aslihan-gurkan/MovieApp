//
//  ResultsViewModel.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import Foundation

struct ResultsViewModel {
    var resultList : [Result]
}

extension ResultsViewModel {
    func numberOfRowsInSection() -> Int {
        return self.resultList.count
    }
    func resultAtIndex(_ index : Int) -> ResultViewModel {
        let result = self.resultList[index]
        return ResultViewModel(result: result)
    }
}

struct ResultViewModel {
    let result : Result
}

extension ResultViewModel {
    var adult : Bool {
        return self.result.adult
    }
    var id : Int {
        return self.result.id
    }
    var originalLanguage : String {
        return self.result.original_language
    }
    var originalTitle : String {
        return self.result.original_title
    }
    var overview : String {
        return self.result.overview
    }
    var popularity : Double {
        return self.result.popularity
    }
    var posterPath : String {
        return self.result.poster_path
    }
    var releaseDate : String {
        return self.result.release_date
    }
    var title : String {
        return self.result.title
    }
    var video : Bool {
        return self.result.video
    }
    var voteAverage : Double {
        return self.result.vote_average
    }
    var voteCount : Int {
        return self.result.vote_count
    }
}
