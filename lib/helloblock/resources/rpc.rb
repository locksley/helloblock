require 'helloblock/resources/query'
require 'helloblock/api_interface/endpoints'
require 'helloblock/api_interface/api_parameters'

module HelloBlock
  class RPC
    extend HelloBlock::Query
    include HelloBlock::Endpoints

    def self.getrawtransaction(conditions)
      where(conditions)
      query[:path] = "/getrawtransaction"
      self
    end
  end
end
