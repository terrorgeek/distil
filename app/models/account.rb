class Account < ActiveRecord::Base
  has_many :domains
end
