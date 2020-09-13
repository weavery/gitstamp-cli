# This is free and unencumbered software released into the public domain.

##
# A Gitstamp transaction is an Arweave transaction with specific tags.
class Gitstamp::Transaction
  ##
  # The transaction's associated commit.
  #
  # @return [Commit] commit
  attr_reader :commit

  ##
  # Constructs a transaction from a commit.
  #
  # @param  [Commit] commit
  # @return [void]
  def initialize(commit)
    @commit = commit
  end

  ##
  # Signs this transaction as originating from the given wallet.
  #
  # @param  [Arweave::Wallet] wallet
  # @return [Arweave::Transaction] the signed Arweave transaction
  def sign(wallet)
    tx = Arweave::Transaction.new(data: @commit.message.to_s)
    @commit.to_tags.each do |name, value|
      tx.add_tag(name: name, value: value)
    end
    tx.sign(wallet)
  end

  ##
  # Submits this transaction to the Arweave network.
  #
  # @param  [Arweave::Wallet] wallet
  # @return [String] the posted Arweave transaction ID
  def publish!(wallet)
    tx = self.sign(wallet)
    tx.commit
    tx.attributes[:id]
  end
end # Gitstamp::Transaction
