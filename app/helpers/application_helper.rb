module ApplicationHelper
  def navbar
    if current_user
      "user_navbar"
    else
      "guest_navbar"
    end
  end
end
