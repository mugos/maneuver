require 'test_helper'

class HostCrudTest < MiniTest::Spec
  describe "Create" do
    it "rendering" do # DISCUSS: not sure if that will stay here, but i like the idea of presentation/logic in one place.
      form = Host::Create.present({}).contract
      form.prepopulate! # this is a bit of an API breach.

      form.name.must_equal nil
      form.address.must_equal nil
      form.user.must_equal nil
      form.key.must_equal nil
    end

    it "persists valid" do
      host = Host::Create[host: {
        name: "Test Name Host",
        address: "http://teste.com.br",
        sys_user: "teste",
        key: {}
      }].model

      host.persisted?.must_equal true

      form.name.must_equal "Test Name Host"
      form.address.must_equal "http://teste.com.br"
      form.user.must_equal "teste"
      form.key.must_equal ""
    end

    it "invalid" do
      res, op = Host::Create.run(host: {
        name: "",
        address: "teste.com.br",
        sys_user: "",
        key: {}
      })

      res.must_equal false
      op.errors.blank?.must_equal false
      op.model.persisted?.must_equal false
      op.invocations[:default].must_equal nil
    end
  end

  describe "Update" do
    before { user }

    let (:host) { Host::Create[host: {
      name: "",
      address: "teste.com.br",
      sys_user: "",
      key: {}
    }].model }

    let (:user) { User::Create.(user: {email: "solnic@trb.org"}).model }

    it "persists valid" do
      Host::Update::SignedIn.(
        id: host.id,
        host: { name: "New Host Test", address: "http://novo.com.br" },
        current_user: user
      ).model

      host.reload
      host.name.must_equal "New Host Test"
      host.address.must_equal "http://novo.com.br"
    end
  end
end
