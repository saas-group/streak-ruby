module Streak
  class Comment < StreakObject
    def self.all(key)
      res = Streak.request(:get, "/v2/boxes/#{key}/comments")
      convert_to_streak_object(res, Comment)
    end

    def self.find(key)
      res = Streak.request(:get, "/v2/comments/#{key}")
      convert_to_streak_object(res, Comment)
    end

    def self.create(key, params)
      res = Streak.request(:post, "/v2/boxes/#{key}/comments", MultiJson.dump(params))
      convert_to_streak_object(res, Comment)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/v2/comments/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Comment)
    end
  end
end

