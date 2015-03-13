class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  extend OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
   has_many :groups
   has_many :posts
   has_many :group_users
   has_many :participated_groups , :through => :group_users ,:source => :group

   def is_member_of?(group)
    participated_groups.include?(group)
  end
  def join!(group)
    participated_groups << group
  end
  def quit!(group)
    participated_groups.delete(group)  
  end
end
