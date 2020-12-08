# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)  
    #can :read, :all # permissions for every user, even if not logged in    
 
      if user.comum?
        can :manage, Blog, usuario: user.email 
      end;  
      
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
      if user.especial?  # additional permissions for administrators
        can :manage, Blog
      end


  end
end
