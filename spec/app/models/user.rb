# frozen_string_literal: true

class User
  include Dynamoid::Document

  field :name
  field :email
  field :password
  field :admin, :boolean
  field :last_logged_in_at, :datetime

  field :favorite_colors, :serialized
  field :todo_list, :array

  has_and_belongs_to_many :subscriptions

  has_many :books, class_name: 'Magazine', inverse_of: :owner
  has_one :monthly, class_name: 'Subscription', inverse_of: :customer

  has_and_belongs_to_many :followers, class_name: 'User', inverse_of: :following
  has_and_belongs_to_many :following, class_name: 'User', inverse_of: :followers

  belongs_to :camel_case
end
