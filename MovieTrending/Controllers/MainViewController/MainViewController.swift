//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Bruno Mazzocchi on 27/6/24.
//

import UIKit

class MainViewController: UIViewController {

    // IBoutlets:
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        // Do any additional setup after loading the view.
        self.title = "Main view"
        self.view.backgroundColor = .red
        
        setUpTableView()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
