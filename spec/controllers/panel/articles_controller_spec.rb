require 'spec_helper'

describe Panel::ArticlesController do
  login_admin

  def valid_attributes
    {}
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      get :new
      assigns(:article).should be_a_new(Article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :edit, :id => article.id
      assigns(:article).should eq(article)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, :article => valid_attributes
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, :article => valid_attributes
        assigns(:article).should be_a(Article)
        assigns(:article).should be_persisted
      end

      it "redirects to the created articles list" do
        post :create, :article => valid_attributes
        #response.should redirect_to(Article.last)
        response.should redirect_to(panel_articles_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, :article => {}
        assigns(:article).should be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        post :create, :article => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested article" do
        article = Article.create! valid_attributes
        # Assuming there are no other articles in the database, this
        # specifies that the Article created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Article.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => article.id, :article => {'these' => 'params'}
      end

      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        put :update, :id => article.id, :article => valid_attributes
        assigns(:article).should eq(article)
      end

      it "redirects to the articles list" do
        article = Article.create! valid_attributes
        put :update, :id => article.id, :article => valid_attributes
        response.should redirect_to(panel_articles_url)
      end
    end

    describe "with invalid params" do
      it "assigns the article as @article" do
        article = Article.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        put :update, :id => article.id, :article => {}
        assigns(:article).should eq(article)
      end

      it "re-renders the 'edit' template" do
        article = Article.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Article.any_instance.stub(:save).and_return(false)
        put :update, :id => article.id, :article => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, :id => article.id
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! valid_attributes
      delete :destroy, :id => article.id
      response.should redirect_to(panel_articles_url)
    end
  end
end
