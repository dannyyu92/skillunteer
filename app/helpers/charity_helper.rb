module CharityHelper
  def charities_grabber
    charities = []

    @a = Mechanize.new { |agent|
      agent.user_agent_alias = "Mac Firefox"
    }

    # Form submission by category and zipcode
    category_links = form_handler("#{@category} 13903")
    # Form submission by only zipcode
    zipcode_links = form_handler("13902")

    # Fill with most relevant charities
    category_links.each do |link|
      if charities.size < 3
        if (link.text.downcase.include? "#{@category}") && (link.uri.to_s.include? "organizations")
          charities << { name: link.text.strip, uri: link.uri.to_s }
        end
      else
        break
      end
    end

    # Fill with random charities in zipcode
    until charities.size == 3
      random = zipcode_links.sample
      if (random.uri.to_s.include? "organizations") && !(random.text.downcase.include? "read")
        charities << { name: random.text.strip, uri: random.uri.to_s }
      end
    end

    charities
  end

  def form_handler(query)
    form = @a.get("http://www.guidestar.org/").forms.first
    form.field_with(:name => "ctl00$phMainBody$txtKeywords").value = query
    form.click_button.links
  end

  module_function :charities_grabber
end
