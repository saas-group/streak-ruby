module Streak
  class Thread < StreakObject
    def self.all(box_key)
      res = Streak.request(:get, "/v1/boxes/#{box_key}/threads")
      convert_to_streak_object(res, Thread)
    end

    def self.find(thread_key)
      res = Streak.request(:get, "/v1/threads/#{thread_key}")
      convert_to_streak_object(res, Thread)
    end

    def self.create(key, params, api_key=nil)
      res = Streak.request(:put, "/v1/boxes/#{key}/threads", params, api_key)
      convert_to_streak_object(res, Thread)
    end
  end
end
