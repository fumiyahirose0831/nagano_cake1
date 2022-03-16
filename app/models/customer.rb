class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (is_deleted == false)
  end

    has_many :cart_items, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy

  def full_name
    self.last_name.to_s + " " + self.first_name.to_s
  end


end
