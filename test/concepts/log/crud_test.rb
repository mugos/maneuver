require 'test_helper'

class LogCrudTest < MiniTest::Spec
  before do
    @log_text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
      do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
      sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum.
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
      do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
      sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum.
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
      do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
      sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum.
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
      do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
      ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
      sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
      mollit anim id est laborum."
  end

  describe "Create" do
    it "persists valid" do
      res, op = Log::Create.run(log: {
        name: "Log Name",
        value: @log_text
      })

      log = op.model
      log.persisted? true
      log.name.must_equal "Log Name"
      log.value.must_equal @log_text
    end

    it "invalid" do
      res, op = Log::Create.run(log: {
        name: "",
        value: "invalid log"
      })

      log = op.model
      log.persisted? false
      log.errors.blank?.must_equal false
    end
  end

  describe "Update" do
    let(:log) { Log::Create[log: {name: "Old Log Name", value: @log_text}] }

    it "pesists valid" do
      log = Log::Update[
        id: log.id,
        log: {
          name: "New Log Name",
          value: @log_text
      }].model

      log.persisted? true
      log.name.must_equal "New Log Name"
      log.value.must_equal @log_text
    end

    it "invalid" do
      log = Log::Update[
        id: log.id,
        log: {
          name: "",
          value: ""
      }].model

      log.persisted? false
      log.errors.blank?.must_equal false
    end
  end
end
