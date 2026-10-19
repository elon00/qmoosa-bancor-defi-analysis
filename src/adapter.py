"""Bancor & Carbon DeFi Asymmetric Invariant Engine."""
def validate_carbon_strategy(buy_price_low: float, buy_price_high: float, sell_price_low: float, sell_price_high: float) -> bool:
    return buy_price_low <= buy_price_high <= sell_price_low <= sell_price_high
