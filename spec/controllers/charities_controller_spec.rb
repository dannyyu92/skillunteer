require 'spec_helper'

describe CharitiesController do
	before(:each) do
		@return = double('charity1', :id => 0, :name => 'Animal shelter', :link => 'animals.com', :mission => 'saving the baby animals', :zipcode => '12345')
		@param = double('charity2', :id => 0)
		charity = Charity.create!({:id => 0, :name => 'Animal shelter', :link => 'animals.com', :mission => 'saving the baby animals', :zipcode => '12345'})
	end

	describe 'show' do
		it 'should show the charities' do
			Charity.should_receive(:find).and_return(@return)
			get :show, {:id => 0}
		end
	end

	describe 'edit' do
		it 'Edits a charity in the database' do
			Charity.should_receive(:find).and_return(@return)
			get :edit, {:id => 0}
		end
	end
	describe 'new' do
		it 'Adds a charity to the database' do
			Charity.should_receive(:new).and_return(@return)
			get :new, :charity => {:category => "test"}
		end 
	end

	describe 'destroy' do
		it 'Removes a charity from the database' do
			delete :destroy, {:id => 0}
		end
	end

	describe 'update' do
		it 'Updates charity name if params are filled out' do
			put :update, {:id => 0, :charity => {:name => 'Animal hospital', :link => 'animalhospital.com', :mission => 'Hospital for animlas', :zipcode => '12345'}}
			assigns(:charity).name.should eq('Animal hospital')
		end
	end
end
