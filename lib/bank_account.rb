class BankAccount
  attr_reader :name, :status, :deposit
  attr_writer :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance
    @balance
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    return "Your balance is $#{balance}."
  end



  def valid?
    if @balance > 0 && @status == "open"
       true
    else
      false
    end
  end


  def close_account
    @status = "closed"

  end




end
