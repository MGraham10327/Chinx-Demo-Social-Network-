class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :username, presence: true, uniqueness: true
         
         has_many :friendships, dependent: :destroy
         has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
	# def request_friendship(user_2)
	#      self.friendships.create(friend: user_2)
	# end
	# def active_friends
	# 	self.friendships.map (&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
	# end
	# def pending_friend_request_from
	# 	self.inverse_friendships.where(state: "pending").map(&:user)
	# end
	# def pending_friend_request_to
	# 	self.friendships.where(state: "pending").map(&:friend)
	# end
end