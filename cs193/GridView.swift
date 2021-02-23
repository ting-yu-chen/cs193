//
//  GridView.swift
//  cs193
//
//  Created by TingyuChen on 2021/2/21.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item:Identifiable, ItemView:View {
    private var items:[Item]
    private var viewForItem: (Item) -> ItemView // it's a function (take a item and return its view )
    // they should be public if no init exists
    
    init (items: [Item],  viewForItem : @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader{
            geometry in
            let gridLayout = GridLayout(itemCount: items.count, in: geometry.size)
            ForEach(items){
                item in
                return body(item:item, layout:gridLayout)
            }
        }
    }
    
    private func body(item:Item, layout:GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!;
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .position(layout.location(ofItemAt: index))
    }
}


/*
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
*/
