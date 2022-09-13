//
//  MovieDetailViewController.swift
//  MovieReview
//
//  Created by HwangByungJo  on 2022/09/13.
//

import UIKit
import SnapKit

final class MoviewDetailViewController: UIViewController {

  private var presenter: MovieDetailPresenter!

  init(movie: Movie) {
    super.init(nibName: nil, bundle: nil)

    presenter = MovieDetailPresenter(viewController: self, movie: movie)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .yellow
  }
}

extension MoviewDetailViewController: MovieDetailProtocol {

}
