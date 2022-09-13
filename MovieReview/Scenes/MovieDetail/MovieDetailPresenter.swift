//
//  MovieDetailPresenter.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/09/13.
//

import Foundation

protocol MovieDetailProtocol: AnyObject {

}

final class MovieDetailPresenter: NSObject {

  private weak var viewController: MovieDetailProtocol?

  private var movie: Movie

  init(viewController: MovieDetailProtocol, movie: Movie) {
    self.viewController = viewController
    self.movie = movie
  }
}
