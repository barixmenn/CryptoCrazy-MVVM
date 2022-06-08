//
//  CryptoViewModel.swift
//  CryptoCrazy-MVVM
//
//  Created by macbook on 8.06.2022.
//

import Foundation


struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoModel]
    
    func numberOfRowsInSection() ->  Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoModel
    
    var currency : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}
