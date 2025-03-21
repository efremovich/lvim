require('minuet').setup {
  provider = 'openai_compatible',
  request_timeout = 2.5,
  throttle = 1500,   -- Increase to reduce costs and avoid rate limits
  debounce = 600,    -- Increase to reduce costs and avoid rate limits
  provider_options = {
    openai_compatible = {
      api_key = 'OPENROUTER_API_KEY',
      end_point = 'https://openrouter.ai/api/v1/chat/completions',
      model = 'meta-llama/llama-3.3-70b-instruct',
      name = 'Openrouter',
      optional = {
        max_tokens = 128,
        top_p = 0.9,
        provider = {
          -- Prioritize throughput for faster completion
          sort = 'throughput',
        },
      },
    },
  },
}
