module ApplicationHelper

  def full_title(page_title = '')
    base_title = "MyTripAdvisor"
    if page_title.empty?
      base_title
    else
      base_title + " : " + page_title
    end
  end
end


#Returns the first name
def first_name(full_name)
  full_name.split(" ")[0]
end
