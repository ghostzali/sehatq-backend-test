class User < ApplicationRecord
  belongs_to :role
  has_many :orders
  has_secure_password

  validates :username, :email, :password_digest, :role_id, presence: true
  validates :username, :email, length: { minimum: 3 }
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def as_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end
end
