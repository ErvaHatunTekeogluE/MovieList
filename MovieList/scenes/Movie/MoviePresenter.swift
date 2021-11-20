//
//  MoviePresenter.swift
//  movieList
//
//  Created by Erva Hatun Tekeoğlu on 13.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoviePresentationLogic
{
  func presentMovies(response: Movie.FetchMovie.Response)
}

class MoviePresenter: MoviePresentationLogic
{
  weak var viewController: MovieDisplayLogic?
  
  // MARK: Do something
  
  func presentMovies(response: Movie.FetchMovie.Response)
  {
    var displayedMovies: [Movie.FetchMovie.ViewModel.DisplayedMovies] = []
    for movie in response.movies.results {
        let displayedMovie = Movie.FetchMovie.ViewModel.DisplayedMovies(id: movie.id, originalTitle: movie.originalTitle, overview: movie.overview, posterPath: movie.posterPath, releaseDate: movie.releaseDate, title: movie.title)
        displayedMovies.append(displayedMovie)
    }
    
    let viewModel = Movie.FetchMovie.ViewModel(displayedMovies: displayedMovies)
    viewController?.displayFetchMovies(viewModel: viewModel)
  }
}
