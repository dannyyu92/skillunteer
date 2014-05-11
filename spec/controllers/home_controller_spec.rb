require 'spec_helper'

describe HomeController do
	describe 'searching for charities' do
		before :each do
			@results = [double('charity1'), double('charity2')]
		end

		it 'should call the results method' do
			#Charity.should_receive(:results)
			get :results, {:category => 'test', :zip =>13902}
		end
	end
end
