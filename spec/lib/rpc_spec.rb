require 'spec_helper'

describe HelloBlock::RPC, '.withdraw' do
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  let(:tx1) { 'f37e6181661473c14a123cca6f0ad0ab3303d011246f1d4bb4ccf3fccef2d700' }
  let(:tx2) { '2e07fc821c0519f058a08ee49f0b02a24aa75556913a5bdbac38dd649b1fe824' }

  after :each do
    HelloBlock::RPC.inspect
  end

  it 'adds a batch of transaction hashes to the params and alters the path' do
    HelloBlock::RPC.getrawtransaction(txHashes: [tx1, tx2])

    expect(HelloBlock::RPC.query[:path]).to eq '/getrawtransaction'

    expect(HelloBlock::RPC.query[:params]).to eq(
      txHashes: [tx1, tx2]
    )
  end
end
