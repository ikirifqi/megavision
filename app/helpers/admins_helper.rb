module AdminsHelper
  def breadcrumb(&block)
    content_tag :ol, { :class => "breadcrumb", :itemprop => "breadcrumb" } do
      yield if block
    end
  end

  def breadcrumb_item(name = nil, url = nil, html_options = {}, &block)
    if name.nil? && url.nil? && html_options.empty? && block.nil?
      content_tag :li do
        link_to admins_dashboard_path do
          raw '<span class="glyphicon glyphicon-home"></span>'
        end
      end
    else
      html_options[:class] = "#{html_options[:class]} active" unless url
      content_tag :li, html_options do
        if block
          block.call name, url
        else
          url ? link_to(name, url) : name
        end
      end
    end
  end

  def number_for_statistics(source)
    number_to_human(source, :format => '%n%u', :units => { :thousand => 'K' })
  end
end
