require 'rspec'
require_relative 'task'

describe Task do
  # Story: As a developer, I can create a Task.
  it "has to be real" do
    expect{Task.new}.to_not raise_error
  end

  # Story: As a developer, I can give a Task a title and retrieve it.
  # part 1: check that a new Task has a title value (String) and that it's empty
  it "initializes with an empty string title" do
    expect(Task.new.title).to be_a(String)
    expect(Task.new.title).to eq("")
  end

  # part 2: check that a Task can successfully change a title
  it "can set a new title and retrieve it" do
    task = Task.new
    expect(task.title).to eq("")
    task.set_title "some task"
    expect(task.title).to eq("some task")
  end

  # Story: As a developer, I can give a Task a description and retrieve it.
  # part 1: check that a new task has a description value (String) and that
  # it's empty
  it "initializes with an empty string description" do
    expect(Task.new.description).to be_a(String)
    expect(Task.new.description).to eq("")
  end

  # part 2: check that a Task can successfully change description and retrieve
  # it
  it "can set a new description and retrieve it" do
    task = Task.new
    expect{task.set_description("description")}.to change{task.description}.from("").to("description")
    expect(task.description).to eq("description")
  end

  # Story: As a developer, I can mark a Task done.
  it "can mark task done" do
    task = Task.new
    expect{task.set_done}.to change{task.done}.from(false).to(true)
  end

  # Story: As a developer, when I print a Task that is done, its status is
  # shown.
  # Hint: Implement to_s have it return the features of a Task with labels (for
  # instance, "Title: Buy Food Description: Bananas, milk").
  it "prints when it is done" do
    task = Task.new
    expect(task.to_s).to eq("")
    task.set_title("title")
    task.set_description("description")
    task.set_done
    expect(task.to_s).to eq("Title: title; Description: description")
  end
end
