module Streak
  class Field < StreakObject
    def self.all(pipeline_key)
      res = Streak.request(:get, "/v1/pipelines/#{pipeline_key}/fields")
      convert_to_streak_object(res, Field)
    end

    def self.find(pipeline_key, field_key)
      res = Streak.request(:get, "/v1/pipelines/#{pipeline_key}/fields/#{field_key}")
      convert_to_streak_object(res, Field)
    end

    def self.create(pipeline_key, params, api_key=nil)
      res = Streak.request(:put, "/v1/pipelines/#{pipeline_key}/fields", params, api_key)
      convert_to_streak_object(res, Field)
    end

    def self.update(pipeline_key, field_key, params={}, api_key=nil)
      res = Streak.request(:post, "/v1/pipelines/#{pipeline_key}/fields/#{field_key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Field)
    end
  end
end

