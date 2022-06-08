    //
    //  ViewController.swift
    //  CryptoCrazy-MVVM
    //
    //  Created by macbook on 8.06.2022.
    //

    import UIKit

    class ViewController: UIViewController {
        
        private var cryptoListViewModel : CryptoListViewModel!
        
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            // Do any additional setup after loading the view.
            
            
            getData()
        }
        
        
        
        
        func getData () {
            let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
            
            Webservice().dowloadCurrency(url: url) { (crypto) in
                
                if let crypto = crypto {
                    self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: crypto)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
                
            }
        }
    }







    extension ViewController: UITableViewDelegate,UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
            cell.priceLabel.text = cryptoViewModel.price
            cell.currencyLabel.text = cryptoViewModel.currency
            return cell
        }
    }


