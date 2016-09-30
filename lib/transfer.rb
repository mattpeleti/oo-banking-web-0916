require "pry"
class Transfer
  attr_reader :sender, :receiver, :amount, :status
  attr_writer :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end


  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance - amount < 0
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif !valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif valid? && status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end




  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end


  end

end
