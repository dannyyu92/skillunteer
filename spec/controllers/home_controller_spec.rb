require 'spec_helper'

=begin

Rspec tests not nessassary because models are not used
This is because nothing is saved to the database, the results are just rendered

describe HomeController do
	describe 'searching for charities' do
		before :each do
			@results = [{:name => 'fake', :uri =>'fake.com'}]
			#hard code zip code too
			set(:@category, 'scouts')
		end

		it 'should call the helper method that performs the search'
			#based on model that we will have
			assigns(:@category).should == 'scouts'
			@top_charities.should == @results

		it 'should select the Search Results template for rendering'
			#stub method may or may not be called
			Home.stub(:charities_grabber).and_return(results)
			post :search_charities, {:search_terms => 'Computers'}
			response.should render_template('search_charities')

		it 'should make the charity search results available to that template'
			Home.stub(:find_in_DB).and_return(results)
			assings(@top_charities).should == @results
=end
	end
end
