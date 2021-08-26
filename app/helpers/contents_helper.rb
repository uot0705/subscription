module ContentsHelper
  def sort_order(column, title)
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }, class: 'sorter'
  end

    def number_to_currency(price)
      "#{price.to_s(:delimited, delimiter: ',')}"
    end

end
