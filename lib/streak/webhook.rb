module Streak
  class Webhook < StreakObject
    def self.all_pipeline_webhooks(key)
      res = Streak.request(:get, "/v2/pipelines/#{key}/webhooks")
      convert_to_streak_object(res, Webhook)
    end

    def self.all_team_webhooks(key)
      res = Streak.request(:get, "/v2/teams/#{key}/webhooks")
      convert_to_streak_object(res, Webhook)
    end

    def self.find(key)
      res = Streak.request(:get, "/v2/webhooks/#{key}")
      convert_to_streak_object(res, Webhook)
    end

    def self.create(pipeline_key, params={}, api_key=nil)
      res = Streak.request(:post, "/v2/webhooks?pipelineKey=#{pipeline_key}", params, api_key)
      convert_to_streak_object(res, Webhook)
    end

    def self.update(key, params, api_key=nil)
      res = Streak.request(:post, "/v2/webhooks/#{key}", MultiJson.dump(params), api_key)
      convert_to_streak_object(res, Webhook)
    end

    def self.destroy(key, api_key=nil)
      res = Streak.request(:delete, "/v2/webhooks/#{key}", {}, api_key)
    end
  end
end

