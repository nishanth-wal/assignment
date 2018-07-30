class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def generate_api_key
    return unless api_token.nil?
    tokens = User.pluck(:api_token)

    token = loop do
      uniq_token = SecureRandom.base58(24)
      break uniq_token unless tokens.include?(uniq_token)
    end

    self.api_token = token
    save!
  end
end
