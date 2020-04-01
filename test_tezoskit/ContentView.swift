//
//  ContentView.swift
//  test_tezoskit
//
//  Created by voxelot on 3/31/20.
//  Copyright © 2020 voxelot. All rights reserved.
//

import SwiftUI
import TezosKit

let publicNodeURL = URL(string: "http://18.197.68.247:8732")!
let tezosNodeClient = TezosNodeClient(remoteNodeURL: publicNodeURL)
//let wallet = Wallet()!


struct ContentView: View {
    var body: some View {
        //Text("Hello, World!")
        Text(getBalance())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getBalance() -> String {
  let address = "KT1BVAXZQUc4BGo3WTJ7UML6diVaEbe4bLZA" // http://tezos.community
  var bal = ""
  tezosNodeClient.getBalance(address: address) { result in
    switch result {
    case .success(let balance):
      bal = "Balance of \(address) is \(balance.humanReadableRepresentation)"
    case .failure(let error):
      bal = "Error getting result: \(error)"
    }
  }
  return bal
}

