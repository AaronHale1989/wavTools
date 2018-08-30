class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :samples
  has_many :paids
  serialize :stripe_account_status, JSON
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


def connected?; !stripe_user_id.nil?; end

def standalone?; stripe_account_type == 'standalone'; end
def oauth?; stripe_account_type == 'oauth'; end

def manager
  case stripe_account_type
  when 'standalone' then StripeStandalone.new(self)
  when 'oauth' then StripeOauth.new(self)
  end
end

def can_accept_charges?
  return true if oauth?
  return true if standalone? && stripe_account_status['charges_enabled']
  return false
end

end
