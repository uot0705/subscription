class User < ApplicationRecord
  has_many :contents, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :check, presence: true # 空NG
  validates :nickname, length: { maximum: 40 }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, on: :create
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true, on: :update
end
