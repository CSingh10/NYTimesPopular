//
//  ItemListViewController.swift
//  NYTimes
//
//  Created by Chandan Singh on 26/01/20.
//  Copyright © 2019 @Personal. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var viewModel = ItemListViewModel()
    var itemListArr = [ItemInfo]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialise()
    }
    
    // MARK: Instance Methods -
    
    func initialise() {
        
        // Along with auto layout, these are the keys for enabling variable cell height
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableView.automaticDimension
        
        self.startAnimate()
        if Reachability.isConnectedToNetwork() == true {
            self.viewModel.handleGetPopulatItemList { (Result) in
                self.stopAnimate()
                switch Result {
                case .success(let results):
            
                    self.itemListArr = results
                    self.refreshTableView()
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            print("Internet connection FAILED")
            self.stopAnimate()
            
            let alertController = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
                print("You've pressed cancel");
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func startAnimate() {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
    }
    
    func stopAnimate() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
    }
    
    func navigateToItemDetailsPage(data:ItemInfo){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailsVC") as! ItemDetailsVC
        viewController.itemDetailsData = data
        viewController.modalTransitionStyle = .flipHorizontal
        self.navigationController?.present(viewController, animated: true, completion: nil)
    }
    
    func refreshTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(self.itemListArr.count > 0){
            return (self.itemListArr.count)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:ItemViewCell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ItemViewCell
        
        let data = (self.itemListArr[(indexPath as NSIndexPath).row]) as ItemInfo
        cell.setCellData(itemData: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let data:ItemInfo = (self.itemListArr[(indexPath as NSIndexPath).row])
        
        self.navigateToItemDetailsPage(data: data)
    }
    
}

