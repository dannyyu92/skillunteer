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
=begin
	describe 'create' do
		it 'Makes a charity' do
			test = Charity.should_receive(:new).and_return(@return).save
			@return.save
			test.stub(:save)
			post :create, {:id => 0, :charity => {:name => 'Animal hospital', :link => 'animalhospital.com', :mission => 'Hospital for animlas', :zipcode => '12345'}}
		end
		it 'saves a charity' do
			Charity.stub(:new).and_return(@return)
			test.should_receive(:save)
			post :create, {:id => 0, :charity => {:name => 'Animal hospital', :link => 'animalhospital.com', :mission => 'Hospital for animlas', :zipcode => '12345'}}
		end
	end
=end
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

		it 'Redirects to charities path' do pending
			#Charity.stub(:find).with(:id => 1).and_return(@return)
			#response.should redirect_to charities_path
		end
	end

	describe 'update' do
		it 'Updates charity name if params are filled out' do
			put :update, {:id => 0, :charity => {:name => 'Animal hospital', :link => 'animalhospital.com', :mission => 'Hospital for animlas', :zipcode => '12345'}}
			assigns(:charity).name.should eq('Animal hospital')
		end
		it 'Renders edit template if params are not filled out' do pending
				#Charity.stub(:update).with()
				#put :update, {:id => 0, :charity => {}}
				#response.should render_template('edit')
		end
	end
end
