require 'spec_helper'

describe HelloBlock::Address, '.find' do
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'retrieves a single address from the API' do
    VCR.use_cassette(:single_address) do
      response = HelloBlock::Address.find(address).to_hash

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Address, '.where' do
  let(:address) { '1DQN9nopGvSCDnM3LH1w7j36FtnQDZKnej' }

  it 'retrieves batch addresses from the API' do
    VCR.use_cassette(:batch_addresses) do
      response = HelloBlock::Address.where(address: [address, address]).to_hash

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Transaction, '.find' do
  let(:tx) { 'f37e6181661473c14a123cca6f0ad0ab3303d011246f1d4bb4ccf3fccef2d700' }

  it 'retrieves a single transaction from the API' do
    VCR.use_cassette(:single_transaction) do
      response = HelloBlock::Transaction.find(tx).to_hash

      expect(response['status']).to eq 'success'
    end
  end
end

describe HelloBlock::Transaction, '.where' do
  let(:tx) { 'f37e6181661473c14a123cca6f0ad0ab3303d011246f1d4bb4ccf3fccef2d700' }

  it 'retrieves a batch of transactions from the API' do
    VCR.use_cassette(:batch_transactions) do
      response = HelloBlock::Transaction.where(transaction: [tx, tx]).to_hash

      expect(response['status']).to eq 'success'
    end
  end
end