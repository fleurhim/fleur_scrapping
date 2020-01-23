require_relative '../lib/townhall_scrapper'

describe "the get_townhall_urls method" do
  it "should return an array of hash, and hash is not nil" do
    expect(get_townhall_urls).not_to be_nil
    expect(get_townhall_urls).to be_a(Array)
    expect(get_townhall_urls.length).to be > 10
  end

  it "should return an array of hash with at least three cities" do
#	expect(get_townhall_urls.reduce({}, :merge)).to include("ABLEIGES")
    expect(get_townhall_urls).to include({"AINCOURT" => "mairie.aincourt@wanadoo.fr"})
    expect(get_townhall_urls).to include({"AMBLEVILLE" => "mairie.ambleville@wanadoo.fr"})
    expect(get_townhall_urls).to include({"AMENUCOURT" => "mairie.amenucourt@wanadoo.fr"})

  end
end

  describe "the get_townhall_email method" do
  it "should return a string with an email, and email is not nil" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/pontoise.html")).not_to be_nil
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/pontoise.html")).to be_an(String)
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to match("mairie.ableiges95@wanadoo.fr")
  end
end