require 'spec_helper'



Rspec tests not nessassary because models are not used
This is because nothing is saved to the database, the results are just rendered

describe HomeController do
	describe 'searching for charities' do
		before :each do
			@results = [mock('charity1'), mock('charity2')]
		end

		it 'should call the method that performs the search by location and keywords'
			#based on model that we will have
			Charity.should_recieve(:results).with('Animals')

		it 'should select the Search Results template for rendering'
			#stub method may or may not be called
			Home.stub(:results).and_return(@results)
			post :results, {:search_terms => 'Animals'}
			response.should render_template('results')

		it 'should make the charity search results available to that template'
			Home.stub(:results).and_return(results)
			assings(@top_charities).should == @results

	end
end
