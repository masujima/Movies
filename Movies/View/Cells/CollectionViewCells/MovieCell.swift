//
//  MovieCell.swift
//  Movies
//
//  Created by Yernar Masujima on 8/8/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MovieCell"
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var movieDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = .textColor.withAlphaComponent(0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMoviePosterImageView()
        configureMovieDetailView()
        configureMovieTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie) {
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            moviePosterImageView.load(url: imageURL)
        }
        movieTitleLabel.text = movie.title
    }
    
    private func configureMoviePosterImageView() {
        addSubview(moviePosterImageView)
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureMovieDetailView() {
        addSubview(movieDetailView)
        NSLayoutConstraint.activate([
            movieDetailView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieDetailView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieDetailView.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieDetailView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureMovieTitleLabel() {
        movieDetailView.addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: movieDetailView.topAnchor, constant: 8),
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieDetailView.leadingAnchor, constant: 8),
            movieTitleLabel.trailingAnchor.constraint(equalTo: movieDetailView.trailingAnchor, constant: -8)
        ])
    }
}
