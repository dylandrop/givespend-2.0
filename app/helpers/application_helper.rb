module ApplicationHelper
  def cents_to_dollars(cents)
    '%.2f' % (cents.to_i/100.0)
  end

  def full_error_message resource, attr_name
    attr_name.to_s.humanize + " " + resource.errors[attr_name].first if !resource.errors[attr_name].empty?
  end
end
