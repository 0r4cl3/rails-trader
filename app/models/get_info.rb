class GetInfo
  attr_reader :client
  def initialize(client, account_number)
    @client = client
    @account_number = account_number
  end

  def fetch_client_info
    @account = client.account(@account_number).get   
  end
end

