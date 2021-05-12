module GroupsHelper
  def views_show_deposits(group)
    out = ''
    group.deposits.includes(:author).each do |deposit|
      out += render 'deposit_list', deposit: deposit
    end
    out.html_safe
  end
end
