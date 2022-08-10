//
//  MovieCell.swift
//  Movies
//
//  Created by Yernar Masujima on 8/8/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MovieCell"
    
    private let moviePosterImageView = UIImageView()
    private let movieDetailView = UIView()
    private let movieTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMoviePosterImageView()
        configureMovieDetailView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie) {
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") {
            moviePosterImageView.load(url: imageURL)
        }
    }
    
    private func configureMoviePosterImageView() {
        moviePosterImageView.contentMode = .scaleAspectFill
        moviePosterImageView.image = UIImage(systemName: "person")
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(moviePosterImageView)
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureMovieDetailView() {
        movieDetailView.backgroundColor = .black.withAlphaComponent(0.5)
        movieDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(movieDetailView)
        NSLayoutConstraint.activate([
            movieDetailView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieDetailView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieDetailView.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieDetailView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
