//
//  DetailsAssets.swift
//  Cripto
//
//  Created by Student13 on 20/10/23.
//

import SwiftUI

struct DetailsAssets: View {
    var idCoin: String
    @StateObject var vm = APIViewModel()
    
    var body: some View {
        VStack {
            if vm.coinDetails.name != nil {
                Text("Name: \(vm.coinDetails.name!)")
            }
            if vm.coinDetails.symbol != nil {
                Text("Symbol: \(vm.coinDetails.symbol!)")
            }
            if vm.coinDetails.rank != nil {
                Text("Rank: \(vm.coinDetails.rank!)")
            }
            if vm.coinDetails.supply != nil {
                Text("Supply: \(vm.coinDetails.supply!)")
            }
            if vm.coinDetails.maxSupply != nil {
                Text("Max Supply: \(vm.coinDetails.maxSupply!)")
            }
            if vm.coinDetails.marketCapUsd != nil {
                Text("Market Cap Usd: \(vm.coinDetails.marketCapUsd!)")
            }
            if vm.coinDetails.priceUsd != nil {
                Text("Price: \(vm.coinDetails.priceUsd!)")
            }
        }.onAppear() {
            vm.fetch(byId: idCoin)
        }
    }
}
