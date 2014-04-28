require 'spec_helper'

describe HomeController do
	describe 'searching for charities' do
		before :each do
			results = [mock('charity1'), mock('charity2'), mock('charity3')]
		end

		it 'should call the model method that performs the search'
			#based on model that we will have
			Home.should_recieve(:find_in_DB).with('Computers').and_return(results)
			#fill in the search box
			post :search_charities, {:search_terms => 'Computers'}

		it 'should select the Search Results template for rendering'
			#stub method may or may not be called
			Home.stub(:find_in_DB).and_return(results)
			post :search_charities, {:search_terms => 'Computers'}
			response.should render_template('search_charities')

		it 'should make the charity search results available to that template'
			Home.stub(:find_in_DB).and_return(results)
			post :search_charities, {:search_terms => 'Computers'}
			assings(:charities).should == @results
	end
end
