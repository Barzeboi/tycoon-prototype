extends StatsandSales


func _ready() -> void:
	event_call.data_entry.connect(_ship_entry)
	
func _ship_entry(ship:String, price: float) -> void:
	GlobalStatistics.market_array.append([ship, price, sales_score])
	print(market_array)
	print(sales_score)
	
	
