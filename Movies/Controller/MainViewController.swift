//
//  ViewController.swift
//  Movies
//
//  Created by Yernar Masujima on 8/2/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private(set) var movies: [Movie] = []
    private let service: MoviesServiceable
    
    init(service: MoviesServiceable) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchData(completion: @escaping (Result<Popular, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getPopular()
            completion(result)
        }
    }
    
    private func loadTableView(completion: (() -> Void)? = nil) {
        fetchData { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies = response.results
                self?.tableView.reloadData()
                completion?()
            case .failure(let error):
                self?.showModal(title: "Error", message: error.customMessage)
                completion?()
            }
        }
    }
    
    private func showDetail(for movie: Movie) {
        Task(priority: .background) {
            let result = await service.getMovieDetail(id: movie.id)
            switch result {
            case .success(let movieResponse):
                showModal(title: movieResponse.title, message: movieResponse.overview)
            case .failure(let error):
                showModal(title: "Error", message: error.customMessage)
            }
        }
    }
    
    private func showModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetail(for: movies[indexPath.row])
    }
}
