require 'test_helper'

class AppCrudTest < MiniTest::Spec
  describe "Create" do
    it "rendering" do # DISCUSS: not sure if that will stay here, but i like the idea of presentation/logic in one place.
      form = App::Create.present({}).contract
      form.prepopulate! # this is a bit of an API breach.

      form.model.name.must_equal nil
    end

    it "persists valid" do
      script = <<-STRING
        bundle install
        rails server
      STRING

      app = App::Create.(
        app: {
          name: "Test App",
          git: "git@bitbucket.org:yebo-dev/sandbox.git",
          script: script
        }
      ).model

      app.persisted?.must_equal true
      app.name.must_equal "Test App"
      app.git.must_equal "git@bitbucket.org:yebo-dev/sandbox.git"
      app.script.must_equal script
    end

    it "invalid" do
      res, op = App::Create.run(
        app: {
          name: "",
          git: "",
          script: ""
        }
      )

      res.must_equal false
      # Validates Operation
      op.errors.to_s.must_equal "{:git=>[\"is invalid\"], :name=>[\"is too short (minimum is 6 characters)\"]}"
      op.model.persisted?.must_equal false
    end

    it "invalid git" do
      res, op = App::Create.run(app: {name: "Test App", git: "@asd.com"})

      res.must_equal false
      op.errors.to_s.must_equal "{:git=>[\"is invalid\"]}"
    end

    it "saves valid git" do
      op = App::Create.(app: {name: "Test App", git: "git@bitbucket.org:yebo-dev/sandbox.git"})

      op.errors.to_s.must_equal "{}"
    end
  end

  describe "Update" do
    let (:created_app) { App::Create.(app: {
      name: "Test App",
      git: "git@bitbucket.org:yebo-dev/sandbox.git",
      script: <<-STRING
        bundle install
        rails server
      STRING
    }).model }

    it "has a app alredy" do
      created_app.name.must_equal "Test App"
      created_app.git.must_equal "git@bitbucket.org:yebo-dev/sandbox.git"
    end

    it "persists valid" do
      app = App::Update.(
        id: created_app.id,
        app: { name: "New App Test", git: "git@bitbucket.org:yebo-dev/not-sandbox.git" }
      ).model

      app.reload
      app.name.must_equal "New App Test"
      app.git.must_equal "git@bitbucket.org:yebo-dev/not-sandbox.git"
    end
  end

  describe "Index" do
    it 'Should present a #{number} of apps' do
      op = App::Index.present({})
      assert !op.model[0].name.nil?, "must be no nil"
      assert !op.model[1].name.nil?, "must be no nil"
    end
  end

  describe "show" do
    it "sees a app that alredy exists" do
      app1 = App::Create.(
        app: {
          name: "Test App",
          git: "git@bitbucket.org:yebo-dev/sandbox.git",
          script: ""
        }
      ).model

      app2 = App::Show.present(app1).model

      app2.name.must_equal "Test App"
      app2.git.must_equal "git@bitbucket.org:yebo-dev/sandbox.git"
    end  # It
  end # Describe Show

  describe "destroy" do
    it "delete a alterdy existing app" do
      app1 = App::Create.(
        app: {
          name: "Test App",
          git: "git@bitbucket.org:yebo-dev/sandbox.git",
          script: ""
        }
      ).model

      app1.persisted?.must_equal true

      app2 = App::Destroy.(app1).model

      app2.persisted?.must_equal false
    end  # It
  end # Destroy
end # AppCrud
