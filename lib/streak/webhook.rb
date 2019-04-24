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

    def self.create(pipeline_key, params={})
      res = Streak.request(:post, "/v2/webhooks?pipelineKey=#{pipeline_key}", params)
      convert_to_streak_object(res, Webhook)
    end

    def self.update(key, params)
      res = Streak.request(:post, "/v2/webhooks/#{key}", MultiJson.dump(params))
      convert_to_streak_object(res, Webhook)
    end
  end
end

