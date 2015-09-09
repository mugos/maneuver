require 'test_helper'

class HostCrudTest < MiniTest::Spec
  let (:key) { Key::Create.(key: {
    name: "SSH Key Name",
    value: <<-STRING
      ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU
      GPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3
      Pbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA
      t3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En
      mZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx
      NrRFi9wrf+M7Q== server@server.local
    STRING
  }).model }

  describe "Create" do
    it "rendering" do # DISCUSS: not sure if that will stay here, but i like the idea of presentation/logic in one place.
      form = Host::Create.present({}).contract
      form.prepopulate! # this is a bit of an API breach.

      form.model.name.must_equal nil
      form.model.address.must_equal nil
      form.model.sys_user.must_equal nil
      form.model.source.must_equal nil
    end

    it "persists valid" do
      # TODO: Bot a docke app to run ssh
      host = Host::Create.(
        host: {
          name: "Test Host",
          address: "http://teste.com.br",
          sys_user: "root",
          source: "~/source/application",
          key: { id: key.id }
        }
      ).model

      host.persisted?.must_equal true
    end

    it "invalid" do
      res, op = Host::Create.run(
        host: {
          name: "",
          address: "teste",
          sys_user: "",
          source: "source",
          key: { id: key.id }
        }
      )

      res.must_equal false
    end
  end

  describe "Update" do
    let (:created_host) { Host::Create.(host: {
      name: "Test Host",
      address: "http://teste.com.br",
      sys_user: "root",
      source: "~/source/application",
      key: { id: key.id }
    }).model }

    it "has a host already" do
      created_host.name.must_equal "Test Host"
    end

    it "persists valid" do
      host = Host::Update.(
        id: created_host.id,
        host: { name: "Updated Host"}
      ).model

      host.reload
      host.name.must_equal "Updated Host"
    end
  end

  # describe "Index" do
  #   it 'Should present a #{number} of hosts' do
  #     op = Host::Index.present({})
  #     assert !op.model[0].name.nil?, "must not be nil"
  #   end
  # end

  describe "show" do
    it "sees a host that alredy exists" do
      host1 = Host::Create.(
        host: {
          name: "Test Host",
          address: "http://teste.com.br",
          sys_user: "root",
          source: "~/source/application",
          key: { id: key.id }
        }
      ).model

      host2 = Host::Show.present(host1).model

      host2.name.must_equal "Test Host"
      host2.address.must_equal "http://teste.com.br"
    end  # It
  end # Describe Show

  describe "destroy" do
    it "delete a alterdy existing host" do
      host1 = Host::Create.(
        host: {
          name: "Test Host",
          address: "http://teste.com.br",
          sys_user: "root",
          source: "~/source/application",
          key: { id: key.id }
        }
      ).model

      host1.persisted?.must_equal true

      host2 = Host::Destroy.(host1).model
      host2.persisted?.must_equal false
    end  # It
  end # Destroy
end # HostCrud
