module Streak
  class Pipeline < StreakObject
    def self.relations
      { :fields => Streak::Field, :owner => Streak::User, :stages => Streak::Stage }
    end

    def self.all
      res = Streak.request(:get, "/v1/pipelines")
      convert_to_streak_object(res, Pipeline)
    end

    def self.find(key)
      res = Streak.request(:get, "/v1/pipelines/#{key}")
      convert_to_streak_object(res, Pipeline)
    end

    def self.create(params, api_key=nil)
      res = Streak.request(:put, "/v1/pipelines", params, api_key)
      convert_to_streak_object(res, Pipeline)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v1/pipelines/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Pipeline)
    end

    def self.move_box(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/pipelines/#{key}/boxes/batch", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Pipeline)
    end
  end
end

