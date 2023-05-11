//
//  HomeViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Almujab Sidik on 07/05/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=id"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
//            if let response = response as? HTTPURLResponse {
//                print("DEBUG: Response code \(response.statusCode)")
//            }
                
            
            guard let data = data else { return }
//            print("DEBUG: Data \(data)")
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()                }
            } catch let error {
                print("DEBUG: failed to decode with error: \(error)")
            }
        }.resume()
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
}
