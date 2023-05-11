//
//  AllCoinsItemView.swift
//  CryptoCurrencyApp
//
//  Created by Almujab Sidik on 07/05/23.
//

import SwiftUI
import Kingfisher

struct AllCoinsItemView: View {
    let coin: Coin
    
    
    var body: some View {
        HStack {
            
            // Market Cap rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            // Image
            
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            // coin name info
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
            }
            
            
            Spacer()
            // coin price info
            
            VStack(alignment: .trailing, spacing: 4) {
                Text((coin.currentPrice.toCurrency()))
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Text((coin.priceChangePercentage24H.toPercent()))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
    
    
//    struct AllCoinsItemView_Previews: PreviewProvider {
//        static var previews: some View {
//            AllCoinsItemView()
//        }
//    }
    
    




