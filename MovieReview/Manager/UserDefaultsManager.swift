//
//  UserDefaultsManager.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/09/13.
//

import Foundation

protocol UserDefaultsManagerProtocol {

  func getMovies() -> [Movie]
  func addMovie(_ newValue: Movie)
  func removeMovie(_ movie: Movie)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {

  enum Key: String {
    case movie
  }

  func getMovies() -> [Movie] {
    guard let data = UserDefaults.standard.data(forKey: Key.movie.rawValue) else { return [] }
    return (try? PropertyListDecoder().decode([Movie].self, from: data)) ?? []
  }

  func addMovie(_ newValue: Movie) {

    var currentMovies: [Movie] = getMovies()
    currentMovies.insert(newValue, at: 0)

    saveMovie(currentMovies)
  }

  func removeMovie(_ value: Movie) {
    let currentMoves: [Movie] = getMovies()
    let newValue = currentMoves.filter { $0.title !=  value.title }

    saveMovie(newValue)
  }

  private func saveMovie(_ newValue: [Movie]) {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: Key.movie.rawValue)
  }
}
