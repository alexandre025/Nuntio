class CreditCard < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def self.create_from_params(params, owner)
    expiration = params[:payment][:expiration].split('/')
    last_digits = params[:payment][:credit_card].last(4)

    return CreditCard.create(user: owner, month: expiration[0], year: expiration[1])
  end
end
