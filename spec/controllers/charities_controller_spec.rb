require 'spec_helper'

describe CharitiesController do
	before(:each) do
		@return = mock('charity1', :id => 0)
	end

	describe 'new' do
		it 'Adds a charity to the database' do
			Charity.should_receive(:new).and_return(@return)
			get :new, :charity => {:category => "test"}
		end
	end

	describe 'destroy' do
		it 'Removes a charity from the database' do
			Charity.should_receive(:destroy)
			delete :destroy, :id => 0
		end

		it 'Redirects to charities path' do
			Charity.stub(:find).with(:id => 1).and_return(@return)
			response.should redirect_to charities_path
		end
	end

	describe 'update' do
		it 'Updates charity name' do
			Charity.should_receive(:update).and_return(@return)
			put :update, :id => 0
		end
	end


end
