class Domain < ActiveRecord::Base
  belongs_to :account, dependent: :destroy
end
