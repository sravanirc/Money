defmodule Money do
  defstruct amount: nil , currency: nil
 
  def convert(%{amount: amount, currency: from_currency}, to_currency) do
     case from_currency do
      :CAD ->
        if to_currency == :EUR do
          %Money{amount: amount * 1.39, currency: :EUR}
        else
          %Money{amount: amount * 1.29, currency: :USD}
        end

      :EUR ->
        if to_currency == :CAD do
          %Money{amount: round(amount / 1.39), currency: :CAD}
        else
          %Money{amount: round(amount / 1.29), currency: :USD}
        end

      :USD ->
        if to_currency == :CAD do
         %Money{amount: round(amount / 1.29), currency: :CAD}
        else
          %Money{amount: round(amount *1.08), currency: :USD}
        end
      _ ->
        " Invalid currency"
    end
  end

  def add(money_1,money_2) do
    %{amount: first_amount, currency: first_currency} = money_1
    %{amount: second_amount,currency: second_currency} = money_2
    if(first_currency == second_currency) do
      %Money{amount: first_amount + second_amount, currency: first_currency}
    else
      "Unable to add different currencies, please use Convert() to change them to same currency"
    end
  end
  def multiply(money,multiple) do
       %{amount: amount, currency: currency} = money
        %Money{amount: amount*multiple, currency: currency}
     end

     def subtract(money_1,money_2) do
      %{amount: first_amount, currency: first_currency} = money_1
      %{amount: second_amount,currency: second_currency} = money_2
      if(first_currency == second_currency) do
        %Money{amount: first_amount-second_amount, currency: first_currency}
      else
        "Unable to subtract different currencies, please use Convert() to change them to same currency"
      end
    end
end


# Canadian Dollar (:CAD): $1.00
# US Dollar (:USD): $1.29
## European Euro (:EUR): $1.39


