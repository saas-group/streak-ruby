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

    def self.create(box_key, params, api_key=nil)
      res = Streak.request(:post, "/v2/boxes/#{box_key}/tasks", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Task)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/tasks/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Task)
    end
  end
end

