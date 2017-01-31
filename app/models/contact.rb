class Contact < ApplicationRecord

def dateupdated
    return updated_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

end
