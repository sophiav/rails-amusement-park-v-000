class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

  def self.authenticate(name, password)
    user = User.find_by(name: name).try(:authenticate, password)
  end
end
