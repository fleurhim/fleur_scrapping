require_relative '../lib/crypto_scrapper'

describe "the crypto_scrapper method" do
  it "should return an array of hash, and hash is not nil" do
    expect(crypto_scrapper).not_to be_nil
    expect(crypto_scrapper.length).to be > 10
    expect(crypto_scrapper).to be_an(Array)
  end

  it "should return at least the value BTC and ETH" do
    expect(crypto_scrapper.reduce({}, :merge)).to include("BTC")
    expect(crypto_scrapper.reduce({}, :merge)).to include("ETH")
  end
end