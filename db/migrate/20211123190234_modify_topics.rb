class ModifyTopics < ActiveRecord::Migration[6.1]
  def change
    Topic.create :alias => "cat", :title => "Котики"
    Topic.create :alias => "dogs", :title => "Собачки"
    Topic.create :alias => "hamsters", :title => "Хомячки"
    Topic.create :alias => "rabbits", :title => "Кролики"
    Topic.create :alias => "turtles", :title => "Черепашки"
  end
end
