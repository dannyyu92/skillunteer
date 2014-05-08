require 'spec_helper'

describe HomeController do
	describe 'searching for charities' do
		before :each do
			@results = [double('charity1'), double('charity2')]
		end
=begin
		it 'should call the method that performs the search by location and keywords'
			Charity.should_receive(:results)
#.with('Animals')
		it 'should select the Search Results template for rendering'
			Home.stub(:results).and_return(@results)
			get :results, {:category => 'Animals'}
			response.should render_template('results')

		it 'should make the charity search results available to that template'
			Home.stub(:results).and_return(results)
			assings(@top_charities).should == @results
=end
	end
end


#should recieve follow by put or get in rake routes
