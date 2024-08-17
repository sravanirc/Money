defmodule Money do
  defstruct []
  def new(amount, currency) do
         %{amount: Float.floor(amount/100.00) , currency: currency}
  end  
  def convert(%{amount: amount, currency: from_currency}, to_currency) do
     case from_currency do
      :CAD ->
        if to_currency == :EUR do
          Money.new(amount * 1.39, :EUR)
        else
          Money.new(amount * 1.29, :USD)
        end

      :EUR ->
        if to_currency == :CAD do
          Money.new(round(amount / 1.39), :CAD)
        else
          Money.new(round(amount / 1.29), :USD)
        end

      :USD ->
        if to_currency == :CAD do
          Money.new(round(amount / 1.29), :CAD)
        else
          Money.new(round(amount *1.08), :USD)
        end
      _ ->
        " Invalid currency"
    end
  end

  def add(money_1,money_2) do
    %{amount: first_amount, currency: first_currency} = money_1
    %{amount: second_amount,currency: second_currency} = money_2
    if(first_currency == second_currency) do
      IO.inspect(first_amount+second_amount)
      Money.new(first_amount + second_amount, first_currency)
    else
      "Unable to add different currencies, please use Convert() to change them to same currency"
    end
  end
  def multiply(money,multiple) do
       %{amount: amount, currency: currency} = money
        Money.new(amount*multiple, currency)
     end

     def subtract(money_1,money_2) do
      %{amount: first_amount, currency: first_currency} = money_1
      %{amount: second_amount,currency: second_currency} = money_2
      if(first_currency == second_currency) do
        Money.new(first_amount-second_amount, first_currency)
      else
        "Unable to subtract different currencies, please use Convert() to change them to same currency"
      end
    end
end


# Canadian Dollar (:CAD): $1.00
# US Dollar (:USD): $1.29
## European Euro (:EUR): $1.39


