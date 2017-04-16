//
//  ContentDataSource.swift
//  PagingTableView
//
//  Created by InJung Chung on 2017. 4. 16..
//  Copyright © 2017 InJung Chung. All rights reserved.
//

import Foundation

class ContentDataSource {

  let data = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    "Morbi blandit at sapien ac convallis",
    "Nullam odio odio, venenatis vel placerat id, faucibus et sem",
    "Morbi lorem neque, lobortis sit amet ex id, maximus sodales libero",
    "Fusce molestie vel nunc sit amet rutrum",
    "Donec eleifend, neque ac pharetra varius, odio lectus condimentum erat, vel lobortis purus purus ac purus",
    "Curabitur venenatis urna lacus, nec tincidunt est ornare et",
    "Nunc gravida facilisis mi ut elementum",
    "Aenean ultricies cursus ex",
    "Vestibulum elementum diam risus, eget molestie nisl iaculis et",
    "Vivamus eget magna et leo efficitur facilisis",
    "Aenean a dapibus ligula",
    "In massa sapien, faucibus vestibulum est non, placerat congue lectus",
    "Duis ut nulla sit amet enim maximus pharetra vitae vitae elit",
    "Ut malesuada sit amet lorem eu aliquet",
    "Nunc accumsan mattis pellentesque",
    "Proin faucibus velit nec enim aliquam mattis",
    "In hac habitasse platea dictumst",
    "Praesent sollicitudin, turpis ut volutpat tempor, urna sapien egestas quam, vitae scelerisque tellus sem non orci",
    "Etiam ut tellus lacinia tellus vestibulum tempor",
    "Nunc ornare ultrices sapien, in gravida augue",
    "Quisque eget lobortis dolor, sit amet posuere nisi",
    "Vestibulum ipsum libero, pulvinar vulputate leo eleifend, dapibus tempor enim",
    "Nam bibendum dictum odio, eget vehicula elit vehicula in",
    "Sed a risus a erat egestas ullamcorper vitae id massa",
    "Morbi blandit ligula sit amet sodales efficitur",
    "Quisque vulputate vulputate cursus",
    "Quisque tristique feugiat porta",
    "Sed auctor erat ac elementum interdum",
    "In sagittis lacus nec augue laoreet, id ornare nisl auctor",
    "Aenean dolor diam, rhoncus id commodo nec, bibendum et risus",
    "Morbi porttitor velit id consectetur placerat",
    "Sed vehicula diam augue, ut venenatis est ullamcorper nec",
    "Quisque accumsan dui non metus molestie, vitae commodo mi interdum",
    "Nam dapibus lacinia convallis",
    "Morbi ornare dictum nulla, ut fringilla risus eleifend vitae"
  ]
  let numberOfItemsPerPage = 10

  func loadData(at page: Int, onComplete: @escaping ([String]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      let firstIndex = page * self.numberOfItemsPerPage
      guard firstIndex < self.data.count else {
        onComplete([])
        return
      }
      let lastIndex = (page + 1) * self.numberOfItemsPerPage < self.data.count ?
        (page + 1) * self.numberOfItemsPerPage : self.data.count
      onComplete(Array(self.data[firstIndex ..< lastIndex]))
    }
  }
  
}
