require 'rails_helper'

describe QuestionsController do
	before (:each) do
		Question.delete_all
	end

	let!(:question) { FactoryGirl.create :question }

	context "#index" do
		it "loads page successfully" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "assigns @questions the correct shit" do
			get :index
			expect(assigns(:questions)).to include Question.last
		end
		
	end

	context "#show" do
		it "loads page succesfully" do
			get :show, :id => question.id
			expect(response).to be_success
		end

		it "renders the show template" do
			get :show, :id => question.id
			expect(response).to render_template("show")
		end
	end

	context "#new" do
		it "loads page successfully" do
			get :new
			expect(response).to be_success
		end

		it "renders the new template" do
			get :new
			expect(response).to render_template("new")
		end
	end

	context "#create" do
		it "creates a new question" do
			expect{
				post :create, :question => attributes_for(:question)
				}.to change { Question.count }.by(1)
		end

		it "redirects the user to the questions#index route" do
			post :create, :question => attributes_for(:question)
			expect(response).to redirect_to(:root)
		end

	end

	context "#edit" do
	end

	context "#update" do
	end

	context "#destroy" do
	end

end