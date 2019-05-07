module Streak
  class Task < StreakObject
    def self.all(box_key)
      res = Streak.request(:get, "/v2/boxes/#{box_key}/tasks")
      convert_to_streak_object(res, Task)
    end

    def self.find(key)
      res = Streak.request(:get, "/v2/tasks/#{key}")
      convert_to_streak_object(res, Task)
    end

    def self.create(box_key, params)
      res = Streak.request(:post, "/v2/boxes/#{box_key}/tasks", MultiJson.dump(params))
      convert_to_streak_object(res, Task)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/v2/tasks/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Task)
    end
  end
end

