require 'test_helper'

class TaskCrudTest < MiniTest::Spec
  describe "Create" do
    it "persists valid" do
      res, op = Task::Create.run(task: {
        name: "Task Name",
        desc: "Description"
      })

      task = op.model
      task.persisted? true
      task.name.must_equal "Task Name"
      task.desc.must_equal "Description"
    end

    it "invalid" do
      res, op = Task::Create.run(task: {
        name: "",
        desc: "invalid task"
      })

      task = op.model
      task.persisted? false
      task.errors.blank?.must_equal false
    end
  end

  describe "Update" do
    let(:task) { Task::Create[task: {name: "Old Task Name", desc: "Description"}] }

    it "pesists valid" do
      task = Task::Update[
        id: task.id,
        task: {
          name: "New Task Name",
          desc: "Description"
      }].model

      task.persisted? true
      task.name.must_equal "New Task Name"
      task.desc.must_equal "Description"
    end

    it "invalid" do
      task = Task::Update[
        id: task.id,
        task: {
          name: "",
          desc: ""
      }].model

      task.persisted? false
      task.errors.blank?.must_equal false
    end
  end
end
