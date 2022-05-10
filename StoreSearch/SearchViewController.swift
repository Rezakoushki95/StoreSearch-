//
//  ViewController.swift
//  StoreSearch
//
//  Created by Reza Koushki on 09/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	var searchResults = [SearchResult]()
	var hasSearched = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		searchBar.delegate = self
		tableView.delegate = self
		tableView.dataSource = self
		tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom: 0, right: 0)
	}
}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		hasSearched = true
		searchBar.resignFirstResponder()
		searchResults = []
		if searchBar.text! != "justin bieber" {
			for i in 0...2 {
				let searchResult = SearchResult()
				searchResult.name = String(format: "Fake Results %d for ", i)
				searchResult.artistName = searchBar.text!
				searchResults.append(searchResult)
			}
		}
		tableView.reloadData()
	}
	
	func position(for bar: UIBarPositioning) -> UIBarPosition {
		return .topAttached
	}
}

// MARK: - Table View Delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if !hasSearched {
			return 0
		} else if searchResults.count == 0 {
			return 1
		} else {
			return searchResults.count
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "SearchResultCell"
		
		var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
		
		if cell == nil {
			cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
		}
		
		if searchResults.count == 0 {
			cell?.textLabel!.text = "(Nothing found)"
			cell?.detailTextLabel!.text = ""
		} else {
			let searchResult = searchResults[indexPath.row]
			cell?.textLabel!.text = searchResult.name
			cell?.detailTextLabel!.text = searchResult.artistName
		}
	
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		if searchResults.count == 0  {
			return nil
		} else {
			return indexPath
		}
	}

}

