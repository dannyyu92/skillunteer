module CharityHelper
  def charities_grabber
    charities = []
    @category_count = 0

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
          page = @a.get("http://guidestar.org/#{link.uri.to_s}")
          mission_statement = get_mission_statement(page)
          charities << { name: link.text.strip.upcase, uri: "http://guidestar.org/#{link.uri.to_s}", mission: format_text(mission_statement) }
          @category_count += 1
        end
      else
        break
      end
    end

    # Fill with random charities in zipcode
    until charities.size == 3
      random = zipcode_links.sample
      if (random.uri.to_s.include? "organizations") && 
        !(random.text.downcase.include? ("read")) && !(random.text.downcase.include? ("donate"))
        page = @a.get("http://guidestar.org/#{random.uri.to_s}")
        mission_statement = get_mission_statement(page)
        charities << { name: random.text.strip.upcase, uri: "http://guidestar.org/#{random.uri.to_s}", mission: format_text(mission_statement) }
      end
    end

    charities
  end

  def form_handler(query)
    form = @a.get("http://www.guidestar.org/").forms.first
    form.field_with(:name => "ctl00$phMainBody$txtKeywords").value = query
    form.click_button.links
  end

  def get_mission_statement(page)
    mission_statement = page.search(".html-snippet")[0].text
    mission_statement.include?("This organization has not provided a mission statement.") ? "" : mission_statement
  end

  def format_text(text)
    text.downcase.capitalize
  end

  module_function :charities_grabber
end
