# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
  
    if user.admin? 
      can :manage, :all
    end    
    
   if user.especial? 
     
       can [:create,:read,:update], Blog
    
    else
      can [:create,:read], Blog
      #can :manage, User
    end
    
    
  end
end
