require_relative '../lib/deputes_scrapper'

describe "the get_deputes_emails method" do
    it "should return a string not empty" do
        expect(get_deputes_emails("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA588884")).not_to be_nil
        expect(get_deputes_emails("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719100")).to be_a(String)
    end
    
    it "should return the correct email" do
        expect(get_deputes_emails("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA606675")).to match("francois.andre@assemblee-nationale.fr")
    end
end

describe "the deputes_informations method" do
    it "should return an array of hash" do
        expect(deputes_informations).not_to be_nil
        expect(deputes_informations).to be_a(Array)
        expect(deputes_informations.length).to be >= 8
    end
end


