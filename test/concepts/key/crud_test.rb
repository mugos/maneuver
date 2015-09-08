require 'test_helper'

class KeyCrudTest < MiniTest::Spec
  before do
    @valid_ssh =  <<-STRING
      ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU
      GPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3
      Pbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA
      t3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En
      mZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx
      NrRFi9wrf+M7Q== server@server.local
    STRING
  end

  describe "Create" do
    it "persists valid" do
      res, op = Key::Create.run(key: {
        name: "Key Name",
        value: @valid_ssh
      })

      key = op.model
      key.persisted?.must_equal true
      key.name.must_equal "Key Name"
      key.value.must_equal @valid_ssh
    end

    it "invalid" do
      res, op = Key::Create.run(key: {
        name: "",
        value: "invalid key"
      })

      key = op.model

      key.persisted?.must_equal false
    end
  end

  describe "Update" do
    let(:persisted) { Key::Create.(key: { name: "Old Key Name", value: @valid_ssh }).model }

    it "pesists valid" do
      res, op = Key::Update.run(
        id: persisted.id,
        key: {
          name: "New Key Name",
          value: @valid_ssh
      })

      key = op.model

      key.persisted?.must_equal true
      key.name.must_equal "New Key Name"
      key.value.must_equal @valid_ssh
    end

    it "invalid" do
      res, op = Key::Update.run(
        id: persisted.id,
        key: {
          name: "",
          value: "Invalid SSH"
      })

      res.must_equal false
    end
  end
end
