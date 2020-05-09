module Streak
  class Meeting < StreakObject
    def self.all(key)
      res = Streak.request(:get, "/v2/boxes/#{key}/meetings")
      convert_to_streak_object(res, Meeting)
    end

    def self.find(key)
      res = Streak.request(:get, "/v2/meetings/#{key}")
      convert_to_streak_object(res, Meeting)
    end

    def self.create(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/boxes/#{key}/meetings", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Meeting)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/meetings/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Meeting)
    end
  end
end

