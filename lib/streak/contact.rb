module Streak
  class Contact < StreakObject
    def self.find(key)
      res = Streak.request(:get, "/v2/contacs/#{key}")
      convert_to_streak_object(res, Comment)
    end

    def self.create(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/contacs/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Comment)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/contacs/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Comment)
    end
  end
end

