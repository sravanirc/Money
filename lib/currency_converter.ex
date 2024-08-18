# This module defines a money struct and provides functions to maniupulate money

defmodule Money do
#This is the money struct with amount and currency
  defstruct amount: nil , currency: nil
  
# This new function takes in the amount and currency and returns a Money struct with 2 float points of amounts
  def new(amount, currency) do 
  %Money{amount: Float.round(amount,2), currency: currency}
  end

  #convert function converts one currency to another based on below conversion rates and private functions
  ## Canadian Dollar (:CAD): $1.00
# US Dollar (:USD): $1.29
## European Euro (:EUR): $1.39
  def convert(money, to_currency) do
    case money.currency do
      :CAD -> if(to_currency == :EUR, do: convert_to_eur(money), else: convert_to_usd(money))
      :EUR -> if(to_currency == :CAD, do: convert_to_cad(money), else: convert_to_usd(money))
      :USD -> if(to_currency == :CAD, do: convert_to_cad(money), else: convert_to_eur(money))
         _ -> " Invalid currency"
    end
  end

  #converts any money to usd
  defp convert_to_usd(money) do 
    case money.currency do 
      :CAD -> Money.new(money.amount * 1.29, :USD)
      :EUR -> Money.new(money.amount / 1.29, :USD)
      _ -> :error 
    end
  end
  #converts anymoney to euros
  defp convert_to_eur(money) do 
    case money.currency do 
      :CAD -> Money.new(money.amount / 1.39, :EUR)
      :USD -> Money.new(money.amount * 1.08, :EUR)
      _ -> :error 
    end
  end

  #converts anymoney to canadian dollors
  defp convert_to_cad(money) do 
    case money.currency do 
      :EUR -> Money.new(money.amount / 1.39, :CAD)
      :USD -> Money.new(money.amount / 1.29, :CAD)
      _ -> :error 
    end
  end

  #adds amounts of two moneys in same currency
  def add(money_1, money_2) do
    if(money_1.currency == money_2.currency) do
      Money.new(money_1.amount + money_2.amount, money_1.currency)
    else
      "Unable to add different currencies, please use Convert() to change them to same currency"
    end
  end

  #multiplies money with given multiple
  def multiply(money, multiple) do
    Money.new(money.amount * multiple, money.currency)
  end
  
  #subtracts money from one currecny to another
  def subtract(money_1, money_2) do
    if(money_1.currency == money_2.currency) do
    Money.new(money_1.amount - money_2.amount,money_1.currency)
    else
      "Unable to subtract different currencies, please use Convert() to change them to same currency"
    end
  end
end