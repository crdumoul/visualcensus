# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def tab_link(category, current_category)
        html_class = ''
        if category.id.equal?(current_category)
            html_class << 'active_tab'
        else
            html_class << 'inactive_tab'
        end

        content_tag(:li, :class => html_class + '_li') do
            li = ""
            if category.id.equal?(current_category)
                li << "<span class=\"#{html_class}\">#{category.name}</span>"
            else
                li << link_to(category.name, {:action => :category, :id => category.id}, {:class => html_class})
            end
            li
        end
    end
end
