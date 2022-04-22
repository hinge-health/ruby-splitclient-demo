require 'dotenv/load'
require 'splitclient-rb'

Dotenv.load

options = { debug_enabled: true, transport_debug_enabled: true }
split_factory = SplitIoClient::SplitFactory.new(ENV['SPLIT_IO_API_KEY'], options)
split_client = split_factory.client

begin
  split_client.block_until_ready
rescue SplitIoClient::SDKBlockerTimeoutExpiredException
  puts 'SDK is not ready. Decide whether to continue or abort execution'
end
