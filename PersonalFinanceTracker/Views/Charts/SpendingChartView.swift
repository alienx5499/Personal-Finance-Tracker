//
//  SpendingChartView.swift
//  PersonalFinanceTracker
//
//  Created by PRABAL PATRA on 04/02/25.
//

//  NOTE: Requires iOS 16+ to use SwiftUI Charts
//

import SwiftUI
import Charts

struct SpendingChartView: View {
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var body: some View {
        VStack {
            Text("Spending Over Time")
                .font(.title)
                .padding()
            
            Chart {
                ForEach(transactionVM.transactions, id: \.self) { transaction in
                    if let date = transaction.date {
                        BarMark(
                            x: .value("Date", date),
                            y: .value("Amount", transaction.amount)
                        )
                        .foregroundStyle(by: .value("Category", transaction.category ?? "Others"))
                    }
                }
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(.white.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Spending Chart")
    }
}
