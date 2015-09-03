require 'test_helper'

class KeyCrudTest < MiniTest::Spec
  before do
    @valid_ssh = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSUGPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3Pbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XAt3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/EnmZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbxNrRFi9wrf+M7Q== schacon@mylaptop.local"
  end

  describe "Create" do
    it "persists valid" do
      res, op = Key::Create.run(key: {
        name: "Key Name",
        value: @valid_ssh
      })

      key = op.model
      key.persisted? true
      key.name.must_equal "Key Name"
      key.value.must_equal @valid_ssh
    end

    it "invalid" do
      res, op = Key::Create.run(key: {
        name: "",
        value: "invalid key"
      })

      key = op.model
      key.persisted? false
      key.errors.blank?.must_equal false
    end
  end

  describe "Update" do
    let(:key) { Key::Create[key: {name: "Old Key Name", value: @valid_ssh}] }

    it "pesists valid" do
      key = Key::Update[
        id: key.id,
        key: {
          name: "New Key Name",
          value: @valid_ssh
      }].model

      key.persisted? true
      key.name.must_equal "New Key Name"
      key.value.must_equal @valid_ssh
    end

    it "invalid" do
      key = Key::Update[
        id: key.id,
        key: {
          name: "",
          value: "Invalid SSH"
      }].model

      key.persisted? false
      key.errors.blank?.must_equal false
    end

  end
end
