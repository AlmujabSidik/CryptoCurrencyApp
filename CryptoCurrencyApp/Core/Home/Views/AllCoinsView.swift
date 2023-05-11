//
//  AllCoinsView.swift
//  CryptoCurrencyApp
//
//  Created by Almujab Sidik on 07/05/23.
//

import SwiftUI

struct AllCoinsView: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Price")
            }
            .padding(.horizontal)
            .font(.caption)
            .foregroundColor(.gray)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        AllCoinsItemView(coin: coin)
                    }
                }
            }
        }
      
        

    }
}
//
//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
