require 'spec_helper'

describe CharitiesController do
	before(:each) do
		@return = mock('charity1')
	end
	describe 'new' do
		it 'Adds a charity to the database' do
			Charity.should_receive(:new).and_return(@return)
			get :new, :charity => {:category => "test"}
		end
	end
end
