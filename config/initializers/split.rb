BLOCK_UNTIL_READY_SECONDS = 10
options = { debug_enabled: true, transport_debug_enabled: true, logger: Logger.new('logfile.log') }

split_factory = SplitIoClient::SplitFactory.new(ENV['SPLIT_IO_API_KEY'], options)
split_client = split_factory.client

begin
  split_client.block_until_ready BLOCK_UNTIL_READY_SECONDS
rescue SplitIoClient::SDKBlockerTimeoutExpiredException
  raise 'split.io SDK is not ready, unable to continue startup'
end

at_exit do
  Rails.configuration.split_client.destroy
end

Rails.configuration.split_factory = split_factory
Rails.configuration.split_client = split_client
