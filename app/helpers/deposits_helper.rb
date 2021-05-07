module DepositsHelper
   def group_btns(groups, deposit)
    out = ''
    groups.each do |group|
      out += if deposit.groups.include?(group)
               render 'remove_group', group: group, grouped_payment: deposit.grouped_deposit_find(group)
             else
               render 'add_group', group: group
             end
    end
    out.html_safe
  end

  def show_icon(deposit)
    return if deposit.groups.empty?

    tag.div class: 'align-self-start' do
      tag.img src: deposit.groups.first.icon, class: 'square-big'
    end
  end
end
