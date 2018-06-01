module SearchHelper
  def contains(query)
    "%#{query.downcase}%"
  end

  def starts_with(query)
    "#{query.downcase}%"
  end

  def ends_with(query)
    "%#{query.downcase}"
  end
end
