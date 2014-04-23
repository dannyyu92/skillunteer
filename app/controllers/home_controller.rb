class HomeController < ApplicationController
  def index
     
  end

  def results
    @category = params[:category].downcase
    @top_charities = []

    a = Mechanize.new { |agent|
      agent.user_agent_alias = "Mac Firefox"
    }

    form = a.get("http://www.guidestar.org/").forms.first
    form.field_with(:name => "ctl00$phMainBody$txtKeywords").value = "#{@category}"
    links = form.click_button.links
    links.each do |link|
      if (link.text.downcase.include? "#{@category}") && (link.uri.to_s.include? "organizations")
        @top_charities << link.text.strip
        @top_charities << link.uri.to_s
      end
    end



  end
end
